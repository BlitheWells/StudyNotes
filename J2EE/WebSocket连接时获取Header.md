```java
// 获取 Header 信息并设置到 config 中
@Configuration
public class ServerEndpointConfigurator extends ServerEndpointConfig.Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        final Map<String, List<String>> headers = request.getHeaders();
        if (headers != null) {
            for (String key: headers.keySet()) {
                sec.getUserProperties().put(key, headers.get(key));
            }
        }
    }
}

@ServerEndpoint(value = "/ws", configurator = ServerEndpointConfigurator.class)
public class WebSocketController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketController.class);

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        // 从 config 中获取header信息
        // config.getUserProperties()
        ...
    }

    @OnMessage
    public String onMessage(String msg, Session session) {
        DateFormat df = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
        String theDate = df.format(new Date());
        return new StringBuilder(theDate).append(" 收到消息: ").append(msg).toString();
    }
}
```
