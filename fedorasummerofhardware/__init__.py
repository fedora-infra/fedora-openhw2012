from pyramid.authentication import AuthTktAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy
from pyramid.exceptions import Forbidden
from pyramid.config import Configurator
from pyramid_beaker import session_factory_from_settings
from pyramid_beaker import set_cache_regions_from_settings
from sqlalchemy import engine_from_config

from .models import DBSession

def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application. """
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    session_factory = session_factory_from_settings(settings)
    set_cache_regions_from_settings(settings)
    config = Configurator(settings=settings, session_factory=session_factory)
    config.set_authentication_policy(AuthTktAuthenticationPolicy(
            settings['authtkt.secret']))
    config.set_authorization_policy(ACLAuthorizationPolicy())
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.add_route('submit', '/submit')
    config.add_route('details', '/details')
    config.add_route('admin', '/admin')
    config.add_route('csv', '/csv')
    config.add_route('approve', '/approve')
    config.add_route('accept', '/accept')
    config.add_route('save_address', '/save_address')
    config.include('pyramid_mailer')
    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_view('fedorasummerofhardware.views.login_view',
                    renderer='fedorasummerofhardware:templates/login.mak',
                    context=Forbidden)
    config.scan()
    return config.make_wsgi_app()
