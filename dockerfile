FROM centos:7
EXPOSE 1521 8080 5500
ENV ORACLE_DOCKER_INSTALL=true
ENV ORACLE_ALLOW_REMOTE=true
ENV ORACLE_BASE=/opt/oracle
ENV ORACLE_SID=XE
ENV ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE
ENV ORAENV_ASK=NO
ENV PATH=$ORACLE_HOME/bin:$PATH
RUN yum update -y
RUN yum install -y file net-tools wget java libnsl.x86_64 vim bc bind-utils glibc-devel initscripts ksh libaio libaio-devel libstdc++-devel make nfs-utils openssh-clients psmisc smartmontools sysstat unzip xorg-x11-utils xorg-x11-xauth compat-libcap1 compat-libstdc++-33 ethtool
COPY oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm /oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm
COPY oracle-database-xe-18c-1.0-1.x86_64.rpm /oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN rpm -i /oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm
RUN rpm -i /oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN rm oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN (echo "Password2020"; echo "Password2020";) | /etc/init.d/oracle-xe-18c configure
CMD /etc/init.d/oracle-xe start && /bin/bash
