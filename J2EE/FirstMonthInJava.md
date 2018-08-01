#### 为什么在 Java 中用Calendar.getInstance().getMonth() 获取的月份的值比现实中的月份少一天？
例如 2018年5月24日，getMonth()返回的值是 7
答案：因为在英文中，月份对应的英文都只是一个标识，是没有编号顺序的，所以很多语言和 Java 一样使用0作为开始
<pre>
January——1月

February——2月

March——3月

April——4月

May——5月

June——6月

July——7月

August——8月

September——9月

October——10月

November——11月

December——12月
</pre>
