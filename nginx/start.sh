#!/bin/bash

 curl -XPUT 'http://elasticsearch:9200/_template/filebeat?pretty' -d@/etc/filebeat/filebeat.template.json
 /etc/init.d/filebeat start
 nginx
 tail -f /var/log/nginx/access.log -f /var/log/nginx/error.log
