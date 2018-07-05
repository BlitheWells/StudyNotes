### VUE 中用 axios 发送数组 form 的处理方法

axios 中一般用 qs 序列化请求

qs 序列化数组请求有几种方式

假设请求是下面这个样子：
```javascript
  {a: ['v1', 'v2', 'v3']}
```
1. 默认序列化是indices，结果是下面这个样子：
```javascript
  qs.stringify({a: ['v1', 'v2', 'v3']}, { arrayFormat: 'indices' })
  
  结果：a[0]=v1&a[1]=v2&a[0]=v3 // 意思应该就是带索引的
```
2. brackets 的序列化方式：
```javascript
  qs.stringify({ id: ['b', 'c'] }, { arrayFormat: 'brackets' })
  
  结果：a[]=v1&a[]=v2&a[]=v3 // 有中括号，没有索引值
```
3. repeat 的序列化方式：
```javascript
  qs.stringify({ id: ['b', 'c'] }, { arrayFormat: 'brackets' })
  
  结果：a=v1&a=v2&a=v3 // 直接重复，这种是 java Spring mvc 能识别和处理的数组方式
```

jQuery 的 ajax 请求也需要设置 traditional: true 来实现等同于第三种方式的参数序列化，traditional 的意思是不去深度序列化。深度序列化后的形式是为了转换成 PHP 或 Ruby on Rails 等其他框架能识别的数组。

#### 参考文章：
https://www.jianshu.com/p/62546d82f380

qs 的使用介绍: https://www.npmjs.com/package/qs
