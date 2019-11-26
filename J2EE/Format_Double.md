
```java
DecimalFormat df = new DecimalFormat("0.00");
DecimalFormat df2 = new DecimalFormat("#.00");

Double aDouble = 12.4567889;
System.out.println(df.format(aDouble)); //12.46
System.out.println(df2.format(aDouble)); //12.46

aDouble = 0.4567889;
System.out.println(aDouble); //0.46
System.out.println(df2.format(aDouble)); //.46

```
