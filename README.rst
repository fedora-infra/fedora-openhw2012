Fedora Summer of Open Hardware 2012
===================================

Authors
-------

 * `Máirín Duffy <http://blog.linuxgrrl.com>`_
 * `Luke Macken <http://lewk.org>`_

Setting up a local instance
---------------------------

::

   yum install -y python-virtualenv git libcurl-devel
   git clone git://github.com/lmacken/fedora-openhw2012.git
   cd fedora-openhw2012
   virtualenv env
   source env/bin/activate
   pip install kitchen pycurl
   python setup.py develop
   initialize_FedoraSummerOfHardware_db development.ini
   pserve development.ini
