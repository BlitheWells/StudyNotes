## 内存模型
1. 方法区：存储class信息，静态便利，final常量，属性和方法信息。

2. 虚拟机栈：方法栈
    (a) 操作数栈；方法中的各种操作数（递归调用有可能会引起栈空间被占满）
    (b) 局部变量；存放方法中用到的变量
    https://www.jianshu.com/p/ecfcc9fb1de7

3. 堆：
    一般new出来的对象都存放在该区域，又分为年轻代和老年代。年轻代又分为，Eden和Survivor区，survivor区又分为form和to。新建对象会被放到Eden区，若对象较大，会直接放到老年代。
    每次youngGC，存活的对象年龄会增大, 超过配置年龄值的对象移到survivor的from区，或者直接移到老年代，survivor区的from区满了会被标记为to区，to区会被清理（移到老年代）变为from区。
    老年代没有剩余空间存放对象，会触发FullGC，若FullGC后仍然不能存放会抛出OutOfMemory异常。

4. 本地方法区：支持本地方法的调用

5. 程序计数器：记录当前线程执行字节码的行号
