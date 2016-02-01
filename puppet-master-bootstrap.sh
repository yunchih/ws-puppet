#! /bin/bash -e


echo "puppet ruby" | xargs pacman -Sy --noconfirm ;
rm /etc/puppetlabs/* -rf;
scp yunchih@linux20.csie.ntu.edu.tw:~/217-base.tar.gz . && \
    tar -zxvf 217-base.tar.gz && \
    mkdir /etc/puppetlabs/files -p && \
    mv 217-base /etc/puppetlabs/files && \
    rm 217-base.tar.gz && \
    cd /etc/puppetlabs/ && \
    git clone https://github.com/yunchih/puppet-master-conf.git && \
    mv puppet-master-conf/* . && rm puppet-master-conf -rf 

gem install r10k;
cmd="/root/.gem/ruby/2.3.0/gems/r10k-2.1.1/bin/r10k" && \
	$cmd deploy environment -p && \
	cd /etc/puppetlabs/code/environments/testing/ && \
	$cmd puppetfile install

