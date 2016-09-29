FROM scratch

ADD filesystem.tar.gz /

EXPOSE 1521 5500 8080

ENV PATH=/u01/app/oracle/product/12.1.0/dbhome_1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    ORACLE_BASE=/u01/app/oracle \
    CVUQDISK_GRP=oinstall \
    ORACLE_SID=ORCL \
    ORACLE_HOME=/u01/app/oracle/product/12.1.0/dbhome_1

CMD /tmp/start
