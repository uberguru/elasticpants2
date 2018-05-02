FROM centos:7

### install Filebeat

ENV FILEBEAT_VERSION 6.2.3

RUN yum -y update && yum -y install epel-release
RUN yum -y install nginx initscripts
RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.rpm \
&& rpm -ivh filebeat-${FILEBEAT_VERSION}-x86_64.rpm \
&& rm filebeat-${FILEBEAT_VERSION}-x86_64.rpm

###############################################################################
#                                CONFIGURATION
###############################################################################

### tweak nginx image set-up

# remove log symlinks
#RUN rm /var/log/nginx/access.log /var/log/nginx/error.log


### configure Filebeat

# config file
ADD filebeat.yml /etc/filebeat/filebeat.yml

###############################################################################
#                                    DATA
###############################################################################

### add dummy HTML file

COPY index.html /usr/share/nginx/index.html

###############################################################################
#                                    START
###############################################################################

    
ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD [ "/usr/local/bin/start.sh" ]
