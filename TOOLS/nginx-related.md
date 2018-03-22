## Useful Command
#### Start
nginx -c /etc/nginx/nginx.conf

#### Test configuration file
nginx -c

#### Reload configuration file
nginx -s reload

#### Stop nginx, two way
1. nginx -s stop
2. ps -ef | grep nginx, then kill master process

## Abount configuration
#### upstream
It's used for http load balance. As below.
```
http {
upstream app1 {
  server example1.com
  server example2.com
  server example3.com
}
...
}
```
Then fill proxy_pass with this upstream in server
```
http {
...
  server {
    listen 80;
    server_name example.com
    
    location / {
      proxy_pass http://app1;
    }
  }
...
}
```
For https, only change http://app1 to https://app1
