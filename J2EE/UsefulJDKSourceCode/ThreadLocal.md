1. 内部定义了一个静态内部类 ThreadLocalMap
2. 一个 Thread 会持有一个 ThreadLocalMap 的引用
3. 当一个 ThreadLocal set value 时，会以 当前 ThreadLocal 为 key （弱引用），设置值到 ThreadLocalMap 中
4. 当一个 ThreadLocal get value 是，会以 当前 ThreadLocal 为 key （弱引用），从 ThreadLocalMap 中获取 value

ThreadLocal: 线程间隔离，线程内共享
