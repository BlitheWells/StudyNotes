#### Start
nginx -c /etc/nginx/nginx.conf

#### Test configuration file
nginx -c

#### Reload configuration file
nginx -s reload

#### Stop nginx, two way
1. nginx -s stop
2. ps -ef | grep nginx, then kill master process

