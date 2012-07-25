import random
import logging

from pyramid.url import route_url
from pyramid.security import remember, authenticated_userid, forget
from pyramid.exceptions import Forbidden
from pyramid.httpexceptions import HTTPFound, HTTPMovedPermanently
from pyramid.view import view_config
from pyramid_mailer import get_mailer
from pyramid_mailer.message import Message

from operator import itemgetter
from collections import defaultdict
from datetime import datetime
from sqlalchemy import func
from fedora.client import FasProxyClient
from webhelpers.constants import us_states, us_territories
from .models import DBSession, Application

log = logging.getLogger(__name__)

us_states_and_territories = sorted(us_states() + us_territories(),
                                   key=itemgetter(1))


def login(username, password):
    fas = FasProxyClient()
    user = fas.get_user_info({'username': username, 'password': password})[1]
    roles = [g.name for g in user['approved_memberships']]
    return user, roles


def authorized_admin(request):
    user = authenticated_userid(request)
    settings = request.registry.settings
    if not user:
        raise Forbidden
    if user not in settings['admin_usernames'].split():
        request.session.flash('%s is not an administrator' % user)
        raise Forbidden
    return user


@view_config(route_name='login',
        renderer='fedorasummerofhardware:templates/login.mak')
def login_view(request):
    if request.POST:
        log.info('Logging into admin view as %s' % request.params['username'])
        try:
            login(request.params['username'], request.params['password'])
        except Exception, e:
            request.session.flash('Invalid Fedora Credentials')
            log.error(str(e))
            return {}
        headers = remember(request, request.params['username'])
        response = HTTPFound(request.environ['HTTP_REFERER'])
        response.headerlist.extend(headers)
        return response
    return {}


@view_config(route_name='logout')
def logout(request):
    headers = forget(request)
    return HTTPFound(location=request.application_url, headers=headers)


@view_config(route_name='home',
        renderer='fedorasummerofhardware:templates/index.mak')
def index(request):
    if 'HTTP_X_FORWARDED_PROTO' in request.environ and \
      request.environ['HTTP_X_FORWARDED_PROTO'] != 'https':
        return HTTPMovedPermanently(location='https://%s/' %
                request.environ['HTTP_HOST'])
    excluded_states = request.registry.settings['exclude_states'].split()
    return {'us_states_and_territories': us_states_and_territories,
            'excluded_states': excluded_states}


@view_config(route_name='details',
        renderer='fedorasummerofhardware:templates/details.mak')
def details(request):
    winners = DBSession.query(Application).filter_by(approved=True).all()
    return {'winners': winners}


@view_config(route_name='csv',
        renderer='fedorasummerofhardware:templates/csv.mak')
def csv(request):
    authorized_admin(request)
    return {'applications': DBSession.query(Application).all()}


@view_config(route_name='admin',
        renderer='fedorasummerofhardware:templates/submissions.mak')
def admin(request):
    authorized_admin(request)
    settings = request.registry.settings
    all = DBSession.query(Application).all()
    unapproved = DBSession.query(func.count(Application.hardware),
                                 Application.hardware) \
                .filter_by(approved=False).group_by(Application.hardware).all()
    approved = DBSession.query(func.count(Application.hardware),
                               Application.hardware) \
                .filter_by(approved=True).group_by(Application.hardware).all()
    hardware = defaultdict(lambda: defaultdict(int))
    selected = []

    for hw in settings['hardware'].split():
        hardware[hw]['num'] = int(settings['num_%s' % hw])
    for num, hw in approved:
        hardware[hw]['approved'] = num
    for num, hw in unapproved:
        hardware[hw]['unapproved'] = num
        entries = DBSession.query(Application) \
                .filter_by(hardware=hw, approved=False).all()
        num_entries = len(entries)
        sample_size = hardware[hw]['num'] - hardware[hw]['approved']
        if sample_size <= 0:
            continue
        if sample_size > num_entries:
            sample_size = num_entries
        selected.extend([entry.id for entry in
            random.sample(entries, sample_size)])

    return {'hardware': hardware, 'applications': all, 'selected': selected}


@view_config(route_name='approve', renderer='json', accept='application/json')
def approve(request):
    authorized_admin(request)
    settings = request.registry.settings
    approved = defaultdict(int)
    approved.update(dict(DBSession.query(
            Application.hardware, func.count(Application.hardware))
            .filter_by(approved=True).group_by(Application.hardware).all()))
    for id in request.params:
        application = DBSession.query(Application).get(int(id))
        hardware = application.hardware
        num_hardware = int(settings['num_%s' % hardware])
        num_approved = approved[hardware]
        if num_approved >= num_hardware:
            request.session.flash('Error: Unable to approve application: ' +
                      '%s out of %s already approved for %s, ' % (
                          num_approved, num_hardware, hardware))
            return HTTPFound(route_url('admin', request))
        if application.approved:
            request.session.flash('Error: Application #%s already approved.' % id)
            return HTTPFound(route_url('admin', request))
        log.info("Approving application: %s" % application)
        application.approved = True
        approved[hardware] += 1
        mailer = get_mailer(request)
        recipient = '%s@fedoraproject.org' % application.username
        message = Message(subject=settings['email_subject'],
                          sender=settings['email_from'],
                          recipients=[recipient],
                          body=settings['email_body'] % (
                              '\n\n%s\n\n' % route_url('accept', request),
                              route_url('details', request),
                              settings['est_shipping']))
        mailer.send_immediately(message, fail_silently=True)
    DBSession.commit()
    request.session.flash('Approved %d entries!' % len(request.params))
    return HTTPFound(route_url('admin', request))


@view_config(route_name='accept',
        renderer='fedorasummerofhardware:templates/accept.mak')
def accept(request):
    if 'HTTP_X_FORWARDED_PROTO' in request.environ and \
      request.environ['HTTP_X_FORWARDED_PROTO'] != 'https':
        return HTTPMovedPermanently(location='https://%s/accept' %
                request.environ['HTTP_HOST'])
    return {}


@view_config(route_name='save_address', request_method='POST')
def save_address(request):
    username = request.params['username']
    try:
        login(username, request.params['password'])
    except:
        request.session.flash('Either your Fedora username or password was incorrect, so we couldn\'t verify your account. Double-check your username, and try typing your password again.')
        return HTTPFound(route_url('accept', request))

    app = DBSession.query(Application).filter_by(username=username).first()
    if not app:
        request.session.flash('Error: You did not submit an application.')
        return HTTPFound(route_url('accept', request))
    if not app.approved:
        request.session.flash('Error: Your application has not been approved.')
        return HTTPFound(route_url('accept', request))
    updated = app.address is not None
    app.address = request.params['address']
    app.phone = request.params['phone']
    if not app.phone:
        request.session.flash('Error: You must enter your phone number.')
        return HTTPFound(route_url('accept', request))

    mailer = get_mailer(request)
    admins = request.registry.settings['admin_email'].split()
    sender = request.registry.settings['email_from']
    body = ("Real Name: %s\nUsername: %s\nCountry: %s\nState: %s\n" +
            "Date of Birth: %s\nHardware: %s\nShield: %s\n" +
            "Date Submitted: %s\nAddress: %s") % (
                   app.realname, app.username, app.country, app.state,
                   app.phone, app.hardware, app.shield, app.date,
                   app.address)
    prefix = "[Fedora Summer of Open Hardware]"
    if updated:
        prefix += "[UPDATED]"
    message = Message(subject="%s Address submitted for %s" %(prefix,username),
                      sender=sender, recipients=admins, body=body)
    DBSession.commit()
    mailer.send_immediately(message, fail_silently=False)
    request.session.flash('Your address has been submitted. You should receive your hardware within six to ten weeks.')
    return HTTPFound(request.application_url)


@view_config(route_name='submit', request_method='POST')
def submit(request):
    def error(msg):
        request.session.flash('Error: %s' % msg)
        return HTTPFound(request.route_url('home',
                _query={'realname': request.params.get('realname', ''),
                        'username': request.params.get('username', ''),
                        'text': request.params.get('text', '')}))

    username = request.params['username']
    try:
        user, groups = login(username, request.params['password'])
    except:
        return error('Either your Fedora username or password was incorrect, so we couldn\'t verify your account. Double-check your username, and try typing your password again.')

    settings = request.registry.settings
    start_date = datetime.strptime(settings['start_date'], '%Y-%m-%d')
    creation_date = datetime.strptime(user.creation.split('.')[0].split()[0],
                                      '%Y-%m-%d')
    if creation_date >= start_date:
        return error('Your Fedora account was created after this contest started. Sorry! Only Fedora accounts created before July 25, 2012 are eligible for this contest.')
    if 'cla_done' not in groups:
        return error('You haven\'t signed the Fedora Project Contributor Agreement. <a href="https://admin.fedoraproject.org/accounts/fpca/">Go sign it</a> and come back here to submit your application again.')
    groups = [group for group in groups if not group.startswith('cla_')]
    if not groups:
        return error('You must be a member of at least one '
                     'non-CLA/FPCA Fedora Group')
    if request.params['hardware'] not in settings['hardware'].split():
        return error('Invalid hardware specified')
    if not request.params['country']:
        return error('You must be a legal resident of one of the listed ' +
                     'countries to submit an entry.')
    if request.params['country'] == 'United States':
        excluded_states = settings['exclude_states'].split()
        for abbrev, state in us_states() + us_territories():
            if request.params['state'] == state:
                if abbrev in excluded_states:
                    return error('Sorry, ' + state + ' residents are not '
                                 'eligible for this contest.')
                break
        else:
            return error('You forgot to select what US state you\'re in. We need to know this to determine your eligibility.')
    if request.params.get('of_age') != 'on':
        return error('If you\'re not of the age of majority in your region, we can\'t accept your application. Please check off the age checkbox at the bottom of the form if you are at least the stated age.')
    if user.email.split('@')[1] == settings['prohibited_users']:
        return error('Red Hat employees are not eligible for this contest, sorry! Didn\'t you read the rules? :) You could order a Gooseberry-Pi off of memo-list...')

    application = DBSession.query(Application).filter_by(username=username).first()
    if application:
        request.session.flash('Your application has been updated!')
    else:
        application = Application(username=username)
        DBSession.add(application)
        request.session.flash('Your application has been submitted! We\'ll be '
                'announcing the winners the week of August 16. You\'ll hear '
                'back from us via email during that week - watch for an '
                'email from <strong>%s</strong>!' % settings['admin_email'])

    application.realname = request.params['realname']
    application.hardware = request.params['hardware']
    application.shield = request.params.get('shield', '')
    application.country = request.params['country']
    application.state = request.params.get('state', '')
    application.text = request.params['text']
    DBSession.commit()

    mailer = get_mailer(request)
    subject = "Thanks for entering!"
    body = """
        You have successfully entered into the Fedora Summer of Open Hardware
        2012 Contest. Drawings will be held on %s.

        Your current hardware selection is: %s

        If you wish to change this, you can go back to the site and resubmit an
        application, which will update your original submission.

        Good luck!
    """ % (settings['stop_date'], application.hardware)
    message = Message(subject=subject, sender=settings['email_from'],
                      recipients=user.email, body=body)
    mailer.send_immediately(message, fail_silently=False)

    return HTTPFound(request.application_url)
