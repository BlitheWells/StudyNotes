跨域的请求分为下面两种：

```
1. 简单请求
（1) 请求方法是以下三种方法之一：
  HEAD
  GET
  POST
（2）HTTP的头信息不超出以下几种字段：
  Accept
  Accept-Language
  Content-Language
  Last-Event-ID
  Content-Type：只限于三个值application/x-www-form-urlencoded、multipart/form-data、text/plain
  
2. 非简单请求
```
对于简单请求浏览器会直接发送请求

对于非简单请求，浏览器会先发一个预检（preflight）请求，请求的 Method 为 OPTIONS，
预检请求的 request 的 header 里面会有以下两个特殊字段：
```
Access-Control-Request-Method
Access-Control-Request-Headers
```
预检的请求的 response 的 header 里面会有以下特殊字段：
```
Access-Control-Allow-Origin //表示同意跨域的源，* 表示允许所有的源，如果需要读取cookie 的值，这个字段不能设置为 *,
必须为明确的，与网页请求一致的源
Access-Control-Allow-Methods //允许跨域的 HTTP Method
Access-Control-Allow-Headers //允许的请求头
Access-Control-Allow-Credentials //是否允许 Cookie
Access-Control-Max-Age //本次预检的有效期，有效期内不用再次发送预检请求
```
