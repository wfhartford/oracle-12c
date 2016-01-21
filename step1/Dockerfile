FROM wscherphof/oracle-linux-7
MAINTAINER Wesley Hartford <wesley@cutterslade.ca>

ENV ORACLE_BASE /u01/app/oracle
ENV CVUQDISK_GRP oinstall

ADD oracle-12.1.0.2-1.zip /tmp/install/oracle-12.1.0.2-1.zip
ADD oracle-12.1.0.2-2.zip /tmp/install/oracle-12.1.0.2-2.zip
ADD oraInst.loc /etc/oraInst.loc
ADD sysctl.conf /etc/sysctl.conf
ADD db_install.rsp /tmp/db_install.rsp
ADD install /tmp/install/install

RUN yum -y install unzip binutils compat-libcap1 compat-libstdc++-33 compat-libstdc++-33.i686 gcc gcc-c++ glibc.i686 glibc glibc-devel glibc-devel.i686 ksh libgcc.i686 libgcc libstdc++ libstdc++.i686 libstdc++-devel libstdc++-devel.i686 libaio libaio.i686 libaio-devel libaio-devel.i686 libXext libXext.i686 libXtst libXtst.i686 libX11 libX11.i686 libXau libXau.i686 libxcb libxcb.i686 libXi libXi.i686 make sysstat vte3 smartmontools && \
    yum -y clean all && \
    cd /tmp/install && \
    unzip oracle-12.1.0.2-1.zip && \
    unzip oracle-12.1.0.2-2.zip && \
    rm *.zip && \
    groupadd -g 54321 oinstall && \
    groupadd -g 54322 dba && \
    userdel oracle && \
    rm -rf /home/oracle && \
    rm /var/spool/mail/oracle && \
    useradd -m -u 54321 -g oinstall -G dba oracle && \
    echo "oracle:oracle" | chpasswd && \
    mkdir -p $ORACLE_BASE && \
    chown -R oracle:oinstall $ORACLE_BASE && \
    chmod -R 775 $ORACLE_BASE && \
    mkdir -p /u01/app/oraInventory && \
    chown -R oracle:oinstall /u01/app/oraInventory && \
    chmod -R 775 /u01/app/oraInventory && \
    chmod 664 /etc/oraInst.loc && \
    echo "oracle soft stack 10240" >> /etc/security/limits.conf && \
    cd /tmp/install/database/rpm && \
    rpm -iv cvuqdisk-1.0.9-1.rpm

CMD /tmp/install/install
