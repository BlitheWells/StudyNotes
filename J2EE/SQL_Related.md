#### MySQL
1. Union 代替 or 会提高查询效率
<pre>
  a) or 可能会全表扫描 
  b) union 可以利用索引
  c) 确定 union 的每个查询记录不重复时可以用 union all，效率会有更大提升
  d) union 要比 or 稳定
</pre>

1. Modify column default value failed, due to still some processes writing into table.
Use "CHANGE" instead of "MODIFY" can fix this problem.

2. explain select * from table1 where colum1= 'xxx' 查询执行计划

3. HASH 和 BTREE
<pre>
  a) HASH 适合精确查找，像"="这种，不适合范围查找；因为 hash 出来的hash码都是无序的。
  b) HASH 索引无法避免排序
  c) HASH 索引hash冲突的问题，所以还是会有表扫描
  d) HASH 索引不能使用索引的部分字段查询， HASH 索引使用所有的索引字段一起计算hash
  e) 大量 HASH 冲突的情况下，HASH 索引性能并不比 BTREE 高
  
  InnoDB 默认使用 BTREE，适合大多数场景。
</pre>

4. show index from table 查看当前表的索引
