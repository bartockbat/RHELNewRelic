FROM registry.access.redhat.com/rhel7 
MAINTAINER gmillard@redhat.com 

#Labels as per spec
LABEL Name rhel7/newrelic:test 
LABEL Vendor Newrelic 
LABEL Release Beta
LABEL Version v0.1

#Install the New Relic repo
RUN rpm -Uvh http://download.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm

#Install the New Relic application
RUN yum -y install newrelic-sysmond.x86_64

#Set your license key - replace with your own
RUN nrsysmond-config --set license_key=<enter_your_key_here>

#This directory is needed for the newrelic run space
RUN mkdir -p /run/lock/subsys

#Cannot use systemd or sysinit, so have to run it as an application
CMD ["/etc/init.d/newrelic-sysmond", "start"]
