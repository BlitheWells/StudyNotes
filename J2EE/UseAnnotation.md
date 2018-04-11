#### Want to get all classes under one annotation
1. Add dependency
```xml
<dependency>
    <groupId>org.reflections</groupId>
    <artifactId>reflections</artifactId>
    <version>0.9.10</version>
</dependency>
```
2. Implements as below
```java
	public void getAllClassesWithAnotaion(String pkgName) {

		Reflections reflections = new Reflections(pkgName);
		Set<Class<?>> classesList = reflections.getTypesAnnotatedWith(Path.class);
		
		for (Class<?> classes : classesList) {
            //得到该类下面的所有方法
            Method[] methods = classes.getDeclaredMethods();
            System.out.println(classes.getName());
            for (Method method : methods) {
                //得到该类下面的Path注解
            	Path path = method.getAnnotation(Path.class);
                if (null != path) {
                    System.out.println(path.value() + " | " + method.getName());
                }
            }
        }
	}
```
