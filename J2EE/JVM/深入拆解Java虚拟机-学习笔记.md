#### 1. 为什么要学习 Java 虚拟机
    1) Java 虚拟机提供了很多配置参数，了解 Java 虚拟机可以针对自己的应用最优化的配置运行参数。
    2) Java 虚拟机是一种工程产品，了解它可以更好的规避它的一些 BUG，也可以更快的识别出 Java 虚拟机中的错误。
    3) 了解最新的垃圾回收算法，以及及时编译器的实现，了解背后的设计理念，和决策依据，以便于以后触类旁通

#### 2. Java 虚拟机是如何执行 Java 代码的
    Java 代码首先被编译成字节码，然后由虚拟机翻译成机器码。
    字节码翻译为机器码分为两种：
        1）解释执行，逐条将字节码翻译成机器码并执行；
        2）即时编译（Just-In-Time compilation, JIT），即将一个方法中包含的所有字节码编译成机器码后再执行。
    前者的优势在于无需等待编译，后者的优势在于实际运行更快。
    
>    Tips: 通过 ASMTools 可以将class字节码转为 Java 虚拟指令。通过虚拟指令可以查看 JVM 怎么执行代码，当然也可以通过查看JVM规范来了解。
>    可参考：https://wiki.openjdk.java.net/display/CodeTools/asmtools
>    别人编译好的 ASMTools：https://github.com/hengyunabc/hengyunabc.github.io/files/2188258/asmtools-7.0.zip
    
