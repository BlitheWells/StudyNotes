
```java
package com.leo.test;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

/**
 * @author WangZilong
 * @date 2020/7/15 11:25
 */
public class CyclicBarrierTest {
    private static Integer doneCount = 0;

    public static void main(String[] args) {
        CyclicBarrier cb = new CyclicBarrier(3, () -> {
            synchronized (doneCount) {
                doneCount ++;
            }
            System.out.println(Thread.currentThread().getId() + ":Something after thread:" + doneCount);

        });
        PrintThread t1 = new PrintThread("t1", cb);
        PrintThread t2 = new PrintThread("t2", cb);
        PrintThread t3 = new PrintThread("t3", cb);
        t1.start();
        t2.start();
        t3.start();
    }

    public static class PrintThread extends Thread {
        private String name;
        private CyclicBarrier cb;
        private Integer step;

        public PrintThread(String name, CyclicBarrier cb) {
            this.name = name;
            this.cb = cb;
            this.step = 0;
        }

        @Override
        public void run() {
            this.step ++;
            System.out.println(Thread.currentThread().getId() + ":Thread " + this.name + " is running in step " + this.step + ".");
            System.out.println(Thread.currentThread().getId() + ":Total thread count is " + cb.getParties() + ", "
                    + cb.getNumberWaiting() + " Thread is waiting.");
            try {
                cb.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                e.printStackTrace();
            }
            this.step ++;
            System.out.println(Thread.currentThread().getId() + ":Thread " + this.name + " is running in step " + this.step + ".");
        }
    }
}
```
