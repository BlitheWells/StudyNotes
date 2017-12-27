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
