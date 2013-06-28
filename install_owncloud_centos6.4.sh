#!/bin/sh
###################################################
#
#   Script written by Bruce Dargus for Xchanging Malaysia Sdn. Bhd.   
#
###################################################

clear
echo "Owncloud installation on CentOS 6.4 x64"
echo "Script by Bruce Dargus for Xchanging Malaysia Sdn. Bhd. | 2013-06-12"
echo "Proceed with installation?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

echo ">>> Updating system..."
yum update -y && yum upgrade -y && yum install -y nano wget dstat

echo ">>> Creating temporary directory..."
mkdir ~/temp_owncloud_install
pushd ~/temp_owncloud_install

echo ">>> Fetching EPEL and REMI repository files from the Internet..."
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

echo ">>> Installing EPEL and REMI repository files..."
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

echo ">>> Enabling dormant REMI repository..."
sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi.repo

echo ">>> Cleaning up temporary files..."
rm -rf ~/temp_owncloud_install

popd > /dev/null
pushd /etc/yum.repos.d > /dev/null

echo ">>> Fetching and Installing Owncloud repository file from the Internet..."
wget http://download.opensuse.org/repositories/isv:ownCloud:community/CentOS_CentOS-6/isv:ownCloud:community.repo

echo ">>> Installing Owncloud..."
yum install owncloud -y
popd

echo ">>> Done."
echo ">>> End of script. Send feedback to bd@dargus.co.uk, thanks."