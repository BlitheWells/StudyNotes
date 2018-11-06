Javascript 根据字符串创建的日期对象会被认为是UTC时间，然后再根据时差换算成本地时间
```
  var aDate = new Date('2018-10-01');
  // aDate 
```
Javascript 根据字符串创建本地日期时间对象
```javascript
  var localDate = new Date(dateString);
  var localTime = localDate.getTime();
  var localOffset = localDate.getTimezoneOffset()*60*1000;
  new Date(localTime + localOffset);
```
