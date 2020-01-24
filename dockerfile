FROM centos 
EXPOSE 1521 8080 5500
ENV ORACLE_DOCKER_INSTALL=true
ENV ORACLE_BASE=/opt/oracle
ENV ORACLE_SID=XE
ENV ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE
ENV ORAENV_ASK=NO 
ENV PATH=$ORACLE_HOME/bin:$PATH
RUN dnf update -y
RUN dnf install -y file net-tools wget java libnsl.x86_64 vim bc bind-utils glibc-devel initscripts ksh libaio libaio-devel libstdc++-devel make nfs-utils openssh-clients psmisc smartmontools sysstat unzip xorg-x11-utils xorg-x11-xauth
COPY compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm /compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
COPY compat-libcap1-1.10-7.el7.x86_64.rpm /compat-libcap1-1.10-7.el7.x86_64.rpm
COPY oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm /oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm
COPY oracle-database-xe-18c-1.0-1.x86_64.rpm /oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN rpm -i /compat-libcap1-1.10-7.el7.x86_64.rpm 
RUN rpm -i /compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
RUN rpm -i /oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm
RUN rpm -i /oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN rm compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm compat-libcap1-1.10-7.el7.x86_64.rpm oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN (echo "Password2020"; echo "Password2020";) | /etc/init.d/oracle-xe-18c configure
RUN . /opt/oracle/product/18c/dbhomeXE/bin/oraenv
# -p 1521:1521 -p 5500:5500 
