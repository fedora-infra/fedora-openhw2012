Fedora Summer of Open Hardware 2012
===================================

.. authors:: Luke Macken <lmacken@redhat.com>, Máirín Duffy <duffy@redhat.com>

Setting up a local instance
---------------------------

.. code-block:: bash

   yum install -y python-virtualenv git libcurl-devel
   git clone git://github.com/lmacken/fedora-openhw2012.git
   cd fedora-openhw2012
   virtualenv env
   source env/bin/activate
   pip install kitchen pycurl
   python setup.py develop
   initialize_FedoraSummerOfHardware_db development.ini
   pserve development.ini
