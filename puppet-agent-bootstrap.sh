#! /bin/bash -e

echo "puppet ruby" | xargs pacman -Sy --noconfirm ;
rm -rf /etc/puppetlabs/;
mkdir -p /etc/puppetlabs/puppet;
cat << EOF > /etc/puppetlabs/puppet/puppet.conf

[main] 
    certname = $(hostname)
	server = repo
	environment = testing

EOF

puppet agent -t --waitforcert 10


