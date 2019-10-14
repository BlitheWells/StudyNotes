#### MySQL
1. Union 代替 or 会提高查询效率
<pre>
  a) or 可能会全表扫描 
  b) union 可以利用不用的索引
  c) 确定 union 的每个查询记录不重复时可以用 union all，效率会有更大提升
  d) union 要比 or 稳定
</pre>

1. Modify column default value failed, due to still some processes writing into table.
Use "CHANGE" instead of "MODIFY" can fix this problem.
