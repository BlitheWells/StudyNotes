1. CountDownLatch, initial with a number N. 
```java
  CountDownLatch countDownLatch = new CountDownLatch(N)
```
2. getCount() return current count.
3. countDown() reduce the count with 1.
4. await() hold current thread until count is 0.

5. 内部类 Sync 继承 AbstractQueuedSynchronizer.
