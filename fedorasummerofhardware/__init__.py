# Copyright (C) 2012 Red Hat, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
