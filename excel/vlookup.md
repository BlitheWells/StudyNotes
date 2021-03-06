## vlookup -- 纵向查找
1. 方法定义
  ```excel
  =vlookup(p1, p2, p3, p4)
  ```
2. 参数
<pre>
  1) p1 -- 要查找的值
  2) p2 -- 查找区域
  3) p3 -- 返回查找返回中的第几列的值
  4) p4 -- 是否精确匹配 (TRUE/FALSE), 通常传FALSE
</pre>

3. 注意事项
```
  1) 若查找范围固定，记得用绝对地址,这样下拉时查找返回不会变动。 eg: $C$1:$E$10 -- C、D 和 E 三列从 1 到 10
  2) p3 是查找区域列的索引，从 1 开始， 比如查找区域是 $C$1:$E$10, 匹配成功需要返回 D 列的值， 则 p3 应传 2
  3) p4 是否精确匹配，通常传FALSE
```

4. 实例
```
=VLOOKUP(A2,$C$1:$E$2,2,FALSE)
https://github.com/BlitheWells/StudyNotes/blob/dev/excel/vlookup-eg.png
```
5. 进阶玩法
```
  1) =vlookup(p1*1, p2, p3, p4) -- 将查找的值转换为数字，解决因查找的值是字符串而查找区域是数值造成的找不到的问题。
  2) =vlookup(p1&"*", p2, p3, p4) -- 将查找的值转为字符串，解决因查找的值是数字而查找区域是字符串造成的找不到的问题。
```
