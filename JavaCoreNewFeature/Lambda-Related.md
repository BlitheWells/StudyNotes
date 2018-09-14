Lambda
-

```java
/*** LambdaTest.java ***/
public class LambdaTest {
    public static void main(String[] args) {
        Runnable task = () -> {System.out.println("Task is running");};
        Thread t = new Thread(task);
        t.start();
    }
}
```
