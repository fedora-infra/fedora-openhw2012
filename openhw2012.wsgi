import site
site.addsitedir('/srv/web/openhw2012/openhw2012/lib/python2.6/site-packages/')

from pyramid.paster import get_app, setup_logging
application = get_app('/srv/web/openhw2012/development.ini', 'main')
setup_logging('/srv/web/openhw2012/development.ini')
