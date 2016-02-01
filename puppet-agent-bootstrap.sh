#! /bin/bash -e

echo "puppet ruby" | xargs pacman -Sy --noconfirm ;
mkdir -p /etc/puppetlabs/puppet;
cat << EOF > /etc/puppetlabs/puppet/puppet.conf

[main] 
    certname = $(hostname)
	server = $puppet_server #Fix me: fill in the hostname of puppet master
	environment = testing

EOF

puppet agent -t --waitforcert 10


