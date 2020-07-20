1. HashMap 实现了 Map 接口， Hashtable 实现了 继承自 Map 接口的 Dictionary

2. HashMap 是线程不安全的， Hashtable 是线程安全的（使用了synchronized关键字）

3. HashMap 的 key 可以为 null， Hashtable 不行

4. HashMap 使用数组加链表的数据接口，JDK1.8以后 链表超过8使用红黑树，小于使用链表。

5. 定位元素的方式， 先获取hash 然后对数组长度取模。

6. 两者加载因子都为0.75
