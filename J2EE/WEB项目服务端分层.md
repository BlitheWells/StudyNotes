一直在模仿别人的代码结构，如果不了解里面的分层逻辑，就一直不能真正分好层，写出来的代码就很乱。

从开始写web项目，就是 Controller, Service, DAO 主要是这三层结构。结构划分还是很好的，但是要弄清楚三层的职责划分，在写代码是严格按照规则来做。
<pre>
Controller 层：
  主要职责：定义web服务接口, 处理登陆等非业务逻辑。
  Controller 层不建议写太多逻辑，在Controller层做好try catch 异常处理，应分为业务异常和系统异常，业务异常应按照不同的错误返回不同的错误码和错误消息，系统异常，统一返回消息。catch 中打印异常log信息。

Service 层：
  主要职责：业务逻辑实现，事务管理。
  Service 层主要是业务逻辑的实现，给Controller层调用，进行数据的处理组装，调用DAO层。Transaction的管理建议写在这一层，对需要加Transaction的方法一定要被Controller层直接调用，因为主流框架Spring的事务管理是通过代理实现的，所以需要外部调用，内部调用会造成事务失效。
</pre>
