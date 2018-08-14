## Useful Command
#### Start
nginx -c /etc/nginx/nginx.conf

#### Test configuration file
nginx -t

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

## About proxy
![avatar](https://github.com/BlitheWells/StudyNotes/blob/dev/TOOLS/%E4%BB%A3%E7%90%86%E5%92%8C%E5%8F%8D%E5%90%91%E4%BB%A3%E7%90%86%E5%AF%B9%E6%AF%94.png)
https://processon.com/diagraming/5ab34e12e4b007d251125960

## nginx 知识
http://tengine.taobao.org/book/chapter_02.html

