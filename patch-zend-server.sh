#!/bin/bash

version=`cat /etc/zce.rc | grep PRODUCT_VERSION | awk -F "=" '{print $2}' | awk -F "." '{print $1}'`

if [ $version == "6" ]; then
    cd /usr/local/zend/lib
    if [ ! -d "oci8-backup" ]; then
        mkdir oci8-backup
        mv libclntsh.so.11.1 oci8-backup/libclntsh.so.11.1.bak
        mv libnnz11.so oci8-backup/libnnz11.so.bak
        mv libociicus.so oci8-backup/libociicus.so.bak
        ln -s /usr/lib/oracle/11.2/client64/lib/libclntsh.so.11.1
        ln -s /usr/lib/oracle/11.2/client64/lib/libnnz11.so
        ln -s /usr/lib/oracle/11.2/client64/lib/libociei.so
    fi
else 
    /usr/bin/patch -p0 -N -r - -i zend-server-5.x-patches

    chmod 755 /etc/profile.d/oracle-instant-client-zend-server.sh
    source /etc/profile
    ldconfig
fi
