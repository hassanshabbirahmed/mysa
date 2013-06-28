#!/bin/sh
#######################################################################
#                                                                     #
#   Script written by Bruce Dargus for Xchanging Malaysia Sdn. Bhd.   #
#                                                                     #
#######################################################################
bash -c "/bin/mkdir -p /tmp/drbdinst && /usr/bin/wget --directory-prefix=/tmp/drbdinst/ http://oss.linbit.com/drbd/8.4/drbd-8.4.3.tar.gz && cd /tmp/drbdinst && /bin/tar xfzp drbd-8.4.3.tar.gz && cd drbd-8.4.3 && /usr/bin/yum -y install kernel\`uname -r| grep -o '5PAE\\|5xen\\|5debug'|tr 5 -\`-devel-\`uname -r|sed 's/\\(PAE\\|xen\\|debug\\)\$//'\` &&/usr/bin/yum -y install flex gcc make && if [ -e configure ]; then ./configure --with-pacemaker --prefix=/usr --with-km --localstatedir=/var --sysconfdir=/etc; fi && make && make install DESTDIR=/ && /bin/rm -rf /tmp/drbdinst"

echo 'Loading module...'
modprobe drbd
echo 'Done.'
echo "Performing lsmod | grep drbd..."
bash -c "lsmod | grep drbd"