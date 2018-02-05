#### 4. 注意数据库返回 null 的问题
```
问题场景：
  使用 SQL 的 SUM() 方法获取一定条件下的总数，若 WHERE 条件查出了 0 条数据，SUM() 会返回 NULL，
  返回的 JAVA Object 也是 NULL，若用这个 Object 做一些处理就会报空指针异常。
解决方案：
  1. 在 SQL 语句中做限制，ISNULL(SUM(amount), 0)
  2. 在程序中对结果做空判断
```
#### 3. JOB 处理数据时，数据状态必须全程跟随
```
问题场景：
  多个线程同时更新订单状态，两个线程同时以 STATUS=1 查到一条订单，逻辑上两个线程都需要以 STATUS=1 为前置条件做处理
  线程 A 锁定该订单，处理业务后更改该订单状态为 STATUS=2
  线程 B 继续走，中间一步丢掉了订单状态，直接用订单 ID 再次拿到该订单，此时订单状态已经变为 STATUS=2
  线程 B 继续以 STATUS=2 状态锁定订单做处理而不自知，造成错误处理或者重复处理
解决方案：
  对于记录状态的更改，若有多线程的处理，一定要加上该业务处理的前置状态，而且这个前置状态应该贯穿整个处理流程，
  任何一个地方脱离原始流程都会造成问题
```
#### 2. 用户相关的信息查询修改等处理时一定要加上用户相关条件，以防止恶意用户对信息的篡改


#### 1. WEBService 调用抛出EOFException
阅读了一下 Jetty 9.1.x 的源码，在 org.eclipse.jetty.http.HttpParser 有下面一段代码, 抛出了 IllegalStateException 异常
```java
            else if (_state==State.CLOSE)
            {
                // Seeking EOF
                if (BufferUtil.hasContent(buffer))
                {
                    // Just ignore data when closed
                    _headerBytes+=buffer.remaining();
                    BufferUtil.clear(buffer);
                    if (_maxHeaderBytes>0 && _headerBytes>_maxHeaderBytes)
                    {
                        // Don't want to waste time reading data of a closed request
                        throw new IllegalStateException("too much data seeking EOF");
                    }
                }
            }
            else if (_state==State.CLOSED)
            {
                BufferUtil.clear(buffer);
            }
```
```
Caused by: java.io.EOFException
	at org.eclipse.jetty.client.http.HttpReceiverOverHTTP.earlyEOF(HttpReceiverOverHTTP.java:203)
	at org.eclipse.jetty.http.HttpParser.parseNext(HttpParser.java:1261)
	at org.eclipse.jetty.client.http.HttpReceiverOverHTTP.shutdown(HttpReceiverOverHTTP.java:129)
	at org.eclipse.jetty.client.http.HttpReceiverOverHTTP.receive(HttpReceiverOverHTTP.java:91)
	at org.eclipse.jetty.client.http.HttpChannelOverHTTP.receive(HttpChannelOverHTTP.java:75)
	at org.eclipse.jetty.client.http.HttpConnectionOverHTTP.onFillable(HttpConnectionOverHTTP.java:103)
	at org.eclipse.jetty.io.AbstractConnection$1.run(AbstractConnection.java:505)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
```
org.eclipse.jetty.http.HttpParser 9.4.x 已经把上面一段代码改掉，不会再抛出 IllegalStateException。已在项目中把Jetty 的版本该为 9.4.x，持续关注是否解决问题。
