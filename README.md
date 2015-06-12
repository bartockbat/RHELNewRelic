# RHELNewRelic

This is a Docker build for the Newrelic application. Note - it will only work correctly on a RHEL7 registered host running Docker v1.5 or greater.

To install:

1. do a git clone https://github.com/bartockbat/RHELNewRelic.git 

2. edit the Dockerfile  - the line that has the following:
	RUN nrsysmond-config --set license_key=<enter_your_key_here>
	Register with Newrelic to get your license key - and replace the <enter_your_key_here> with your key - no brackets <>

3.do a docker build -t rhel7/newrelic:test .

4. Once your container is built, to do a quick test, enter the container:
docker run -it rhel7/newrelic:test bash - you will be presented with a Linux shell prompt

5. run the following command
/etc/init.d/newrelic-sysmond start

6. If no errors are presented, you are running.

7. Check your web dashboard on Newrelic - the SERVERS tab - you will see your container running and showing processes, network activity, etc.


