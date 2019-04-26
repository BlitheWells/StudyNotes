```java
import java.lang.reflect.Field;
import sun.misc.Unsafe;
import sun.reflect.Reflection;
import jdk.nashorn.internal.ir.debug.ObjectSizeCalculator;

/**
 * Created by wangzilong on 2019/4/25.
 */
public class UnsafeTest {
	
	UnsafeTest unsafeTest;
	
	public UnsafeTest() {
		
	}
	
	public UnsafeTest(int value) {
		this.value = value;
	}

    public static void main(String[] args) {
    //UnsafeTest aTest = new UnsafeTest();
		//aTest.unsafeTest = new UnsafeTest();
		//aTest.unsafeTest();
		
		UnsafeTest a = new UnsafeTest(123);
		a.unsafeTest = new UnsafeTest(a.value * 2);
		
		UnsafeTest b = new UnsafeTest(1111);
		b.unsafeTest = new UnsafeTest(b.value * 2);
		
		UnsafeTest.swapObject(a, b);
    }

    private volatile int value = 0;
    private static long valueOffset;
	
	public static void swapObject(UnsafeTest obj1, UnsafeTest obj2) {
		try {
			//通过反射的方式获取Unsafe实例，Unsafe的getUnsafe()必须是bootstrap类加载器加载的类才能调用。
			Field field = Unsafe.class.getDeclaredField("theUnsafe");
			field.setAccessible(true);
			Unsafe unsafe = (Unsafe) field.get(null);
			
			out3(obj1);
			out3(obj2);
			long offset = unsafe.objectFieldOffset(
                    UnsafeTest.class.getDeclaredField("unsafeTest")
            );
			
      // putObject 改变堆内存对应字段的内存信息
			unsafe.putObject(obj1, offset, obj2);
			out3(obj1);
			out3(obj2);
			
			System.out.println("ObjectSizeCalculator.getObjectSize(this): " + ObjectSizeCalculator.getObjectSize(obj1));
			System.out.println("ObjectSizeCalculator.getObjectSize(this): " + ObjectSizeCalculator.getObjectSize(obj2));
			
			
		} catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public static void out3(UnsafeTest aTest) {
		System.out.println("this.value:" + aTest.value + " -- this.unsafeTest.value:" + aTest.unsafeTest.value);
	}
	
	public static void out2(UnsafeTest aTest) {
		System.out.println("this.value:" + aTest.value);
	}

    public void unsafeTest () {
		try {
			
			Field field = Unsafe.class.getDeclaredField("theUnsafe");
			field.setAccessible(true);
			Unsafe unsafe = (Unsafe) field.get(null);
			
            valueOffset = unsafe.objectFieldOffset(
                    UnsafeTest.class.getDeclaredField("value")
            );
        
			System.out.println("offset of value:" + valueOffset);
		
			out();
			unsafe.compareAndSwapInt(this.unsafeTest, valueOffset, 0, 100);
			out();
			unsafe.compareAndSwapInt(this.unsafeTest, valueOffset, 100, 123);
			out();
			
			UnsafeTest aNewUnsafeTest = new UnsafeTest();
			aNewUnsafeTest.value = 11111;
			
			long testObjOffset = unsafe.objectFieldOffset(
                    UnsafeTest.class.getDeclaredField("unsafeTest")
            );
			boolean isSuccess = unsafe.compareAndSwapObject(this, testObjOffset, this.unsafeTest, aNewUnsafeTest); System.out.println("compareAndSwapObject: " + isSuccess);
			//unsafe.putObjectVolatile(this.unsafeTest, 0, aNewUnsafeTest);//compareAndSwapObject(this, 0, this, aNewUnsafeTest);
			System.out.println("putObjectVolatile ");
			out();
		
		} catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public void out() {
		System.out.println("this.value:" + this.value + " -- this.unsafeTest.value:" + this.unsafeTest.value);
	}
}
```
