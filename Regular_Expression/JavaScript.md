- #### Password
```JavaScript
var regex = /(?!^(\d+|[a-zA-Z]+|[!@#$%^&*()_+,.-]+)$)^[\w!@#$%^&*()_+,.-]{6,12}$/
var str = '123456'
regex.exec(str)
str = 'abcdef'
regex.exec(str)
str = '#$%^&*()_+,.-]'
regex.exec(str)
str = '123abc'
regex.exec(str)
/***
第一段，不全是数字，不全是字母，不全是符号。
  (?!^(\d+|[a-zA-Z]+|[!@#$%^&*()_+,.-]+)$)
"?!" 指反向匹配

第二段，数字字母空格下划线和特殊字符组成的集合中的6到12个字符。
^[\w!@#$%^&*()_+,.-]{6,12}$
***/
```

- #### Match website URL 
```JavaScript
var regex = /^(http(s?):)?(\/\/)([\w.\d]+)([\/?]*)(.*)$/
var str = "http://www.github.com"
regex.exec(str)
str = "https://www.github.com" 
/***
Some matched examples:
"//www.github.com", "http://www.github.com/anything", "http://www.github.com?anything"
***/
```
