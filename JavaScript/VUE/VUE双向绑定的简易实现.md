双向绑定有多种实现方式，vue 是重写 Object 属性的 set 方法来实现的。

- **从 view 层到 Object 的绑定：** 监听 keyup 事件，把输入框的值赋值给需要绑定的对象
- **从 Object 到 view 层的绑定：** 使用 Object.defineProperty 方法定义对象属性的 set 方法，在方法内同时对需要绑定的 view 层 value 进行改变，当用 = 表达式赋值时，会触发 set 方法。
```javascript
<html>
<head>
<script>
var testData = {
	bindValue: "test"
}
var reInitalObj = function (obj) {
	Object.keys(obj).forEach(prop => {
		Object.defineProperty(obj, prop, {
			get: () => {
				return a_bind_value;
			},
			set: (value) => {
				document.getElementById('a-test-input').value = value;
				a_bind_value = value
			}
		});
	});
}
function load() {
	var a_bind_value;
	var theInput = document.getElementById('a-test-input');
	//从 Object 到 view 层的绑定
	reInitalObj(testData);

	//从 view 层到 Object 的绑定
	document.addEventListener('keyup', function(e) {
		console.log('theInput.value:', theInput.value);
		testData.bindValue = theInput.value;
	}, false);
}
</script>
</head>
<body onload='load()'>
<input id = 'a-test-input' />
</body>
</html>
```
