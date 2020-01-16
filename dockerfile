from centos 
ENV ORACLE_DOCKER_INSTALL=true
RUN dnf update -y 
RUN dnf install file net-tools wget java libnsl.x86_64 vim bc bind-utils glibc-devel initscripts ksh libaio libaio-devel libstdc++-devel make nfs-utils openssh-clients psmisc smartmontools sysstat unzip xorg-x11-utils xorg-x11-xauth -y
COPY compat-libstd.rpm /compat-libstd.rpm
COPY compat-libcap1-1.10-7.el7.x86_64.rpm /compat-libcap1-1.10-7.el7.x86_64.rpm
COPY oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm /oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm
COPY oracle-database-xe-18c-1.0-1.x86_64.rpm /oracle-database-xe-18c-1.0-1.x86_64.rpm
RUN rpm -i /compat-libcap1-1.10-7.el7.x86_64.rpm 
RUN rpm -i /compat-libstd.rpm
RUN rpm -i /oracle-database-preinstall-18c-1.0-1.el7.x86_64.rpm
RUN rpm -i /oracle-database-xe-18c-1.0-1.x86_64.rpm
