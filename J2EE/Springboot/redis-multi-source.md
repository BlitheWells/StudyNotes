redis 多数据源
```java

/**
 * @Author: wangzilong@111.com.cn
 * @Date: 2023/8/14 17:17
 */
@Configuration
public class RedisXyConfig {

    private static final String COMMA = ",";


    @Value("${spring.redis.sentinel.master}")
    private String master;

    @Value("${spring.redis.password}")
    private String password;

    @Value("${spring.redis.sentinel.nodes}")
    private String nodes;


    @Value("${spring.redis.sentinel.master2}")
    private String master2;

    @Value("${spring.redis.password2}")
    private String password2;

    @Value("${spring.redis.sentinel.nodes2}")
    private String nodes2;

    @Bean(name = "redisTemplate1")
    public RedisTemplate<String, Object> redisTemplate1() {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(lettuceConnectionFactory1());
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
        // key采用String的序列化方式
        template.setKeySerializer(stringRedisSerializer);
        // hash的key也采用String的序列化方式
        template.setHashKeySerializer(stringRedisSerializer);
        // value序列化方式采用jackson
        template.setValueSerializer(jackson2JsonRedisSerializer);
        // hash的value序列化方式采用jackson
        template.setHashValueSerializer(jackson2JsonRedisSerializer);
        template.afterPropertiesSet();
        return template;
    }

    @Primary
    @Bean(name = "lettuceConnectionFactory1")
    public LettuceConnectionFactory lettuceConnectionFactory1() {
        RedisSentinelConfiguration config = new RedisSentinelConfiguration();
        config.master(master);

        // 密码
        config.setPassword(RedisPassword.of(password));

        // 哨兵节点列表
        config.setSentinels(getNodes(nodes));
        return new LettuceConnectionFactory(config);
    }


    @Bean(name = "redisTemplate2")
    public RedisTemplate<String, Object> redisTemplate2() {
        RedisTemplate<String, Object> template = new RedisTemplate<>();
        template.setConnectionFactory(lettuceConnectionFactory2());
        Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
        ObjectMapper om = new ObjectMapper();
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
        jackson2JsonRedisSerializer.setObjectMapper(om);
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();
        // key采用String的序列化方式
        template.setKeySerializer(stringRedisSerializer);
        // hash的key也采用String的序列化方式
        template.setHashKeySerializer(stringRedisSerializer);
        // value序列化方式采用jackson
        template.setValueSerializer(jackson2JsonRedisSerializer);
        // hash的value序列化方式采用jackson
        template.setHashValueSerializer(jackson2JsonRedisSerializer);
        template.afterPropertiesSet();
        return template;
    }

    @Bean(name = "lettuceConnectionFactory2")
    public LettuceConnectionFactory lettuceConnectionFactory2() {
        RedisSentinelConfiguration config = new RedisSentinelConfiguration();
        config.master(master2);

        // 密码
        config.setPassword(RedisPassword.of(password2));

        // 哨兵节点列表
        config.setSentinels(getNodes(nodes2));
        return new LettuceConnectionFactory(config);
    }

    private Set<RedisNode> getNodes(String nodeListStr) {
        Set<RedisNode> redisNodeSet = new HashSet<>();
        if (Objects.isNull(nodeListStr)) {
            throw new IllegalArgumentException("nodeProperties error");
        }
        Splitter.on(COMMA).splitToList(nodeListStr).forEach(x -> redisNodeSet.add(new RedisNode(x.split(":")[0], Integer.parseInt(x.split(":")[1]))));
        return redisNodeSet;
    }
}

```
