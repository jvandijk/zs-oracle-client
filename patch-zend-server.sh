#!/bin/bash

/usr/bin/patch -p0 -N -r - -i zend-server-5.x-patches

chmod 755 /etc/profile.d/oracle-instant-client-zend-server.sh
source /etc/profile
ldconfig
