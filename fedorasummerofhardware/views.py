import logging

from pyramid.url import route_url, resource_url
from pyramid.security import remember, authenticated_userid, forget
from pyramid.exceptions import Forbidden
from pyramid.httpexceptions import HTTPFound, HTTPMovedPermanently
from pyramid.response import Response
from pyramid.view import view_config
from pyramid_mailer import get_mailer
from pyramid_mailer.message import Message

from sqlalchemy import func
from fedora.client.fas2 import AccountSystem
from .models import DBSession, Application

log = logging.getLogger(__name__)


def login(username, password):
    fas = AccountSystem(username=username, password=password,
                        cache_session=False)
    roles = fas.people_query(constraints={
        'username': username, 'group': '%', 'role_status': 'approved'},
        columns=['group'])
    return roles


def authorized_admin(request):
    user = authenticated_userid(request)
    settings = request.registry.settings
    if not user:
        raise Forbidden
    if user not in settings['admin_usernames']:
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
    return {}


@view_config(route_name='csv',
        renderer='fedorasummerofhardware:templates/csv.mak')
def csv(request):
    authorized_admin(request)
    return {'applications': DBSession.query(Application).all()}


@view_config(route_name='admin',
        renderer='fedorasummerofhardware:templates/submissions.mak')
def admin(request):
    authorized_admin(request)
    all = DBSession.query(Application).all()
    unapproved = DBSession.query(func.count(Application.hardware),
                                 Application.hardware) \
                .filter_by(approved=False).group_by(Application.hardware).all()
    approved = DBSession.query(func.count(Application.hardware),
                               Application.hardware) \
                .filter_by(approved=True).group_by(Application.hardware).all()
    return {'applications': all, 'unapproved': unapproved, 'approved': approved}


@view_config(route_name='approve', renderer='json', accept='application/json')
def approve(request):
    authorized_admin(request)
    application = DBSession.query(Application).get(int(request.params['id']))
    print("Approving application: %s" % application)
    application.approved = True
    DBSession.commit()
    mailer = get_mailer(request)
    recipient = '%s@fedoraproject.org' % application.username
    sender = request.registry.settings['from_email']
    subject = request.registry.settings['subject']
    # TODO: Send email with unique URL to address form
    body = """\
    """
    message = Message(subject=subject, sender=sender,
                      recipients=[recipient], body=body)
    mailer.send_immediately(message, fail_silently=False)
    return {}


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
        return Response("Invalid Fedora Credentials")

    app = DBSession.query(Application).filter_by(username=username).one()
    if not app.approved:
        return Response("Sorry, your application has not been approved.")

    app.address = request.params['address']

    mailer = get_mailer(request)
    admins = request.registry.settings['admin_email'].split()
    sender = request.registry.settings['from_email']
    body = """\
        Username: %s
        Hardware: %s
        Date Submitted: %s
        Address: %s
    """ % (app.username, app.hardware, app.date, app.address)

    message = Message(subject="Address submitted for %s" % username,
                      sender=sender, recipients=admins, body=body)
    DBSession.commit()
    mailer.send_immediately(message, fail_silently=False)


@view_config(route_name='submit', request_method='POST')
def submit(request):
    username = request.params['username']
    try:
        roles = login(username, request.params['password'])
    except:
        return Response("Invalid Fedora Credentials")

    groups = [role['group'] for role in roles]
    if 'cla_done' not in groups:
        return Response('You must first sign the Fedora CLA')
    groups = [group for group in groups if not group.startswith('cla_')]
    if not groups:
        return Response('You must be a member of at least one non-CLA / FPCA '
                        'Fedora Group')
    if request.params['hardware'] not in ('raspberrypi', 'arduino', 'olpc'):
        return Response('Invalid hardware specified')
    if DBSession.query(Application).filter_by(username=username).first():
        return Response('You can only submit one application')

    application = Application(username=username,
            fullname=request.params['fullname'],
            hardware=request.params['hardware'],
            text=request.params['text'])

    DBSession.add(application)
    DBSession.commit()

    return Response("Your application has been submitted!")
