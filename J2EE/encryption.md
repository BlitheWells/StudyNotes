- 对称加密，加密方和解密方持有相同的私钥，应用场景为一般情况下的一对一加密
- 非对称加密，加密方持有公钥，对消息进行加密，解密方持有私钥，只有该私钥可以解密小心，应用场景多为一对多的，以防止对称加密时解密方持有相同密钥而引发的密钥泄漏风险

AES 和 DES 都为对称加密

#### SHA256
```java
String contentNeedToBeEncrypted = "contentNeedToBeEncrypted";
MessageDigest md = MessageDigest.getInstance("SHA-256");
byte[] sign = md.digest(contentNeedToBeEncrypted.getBytes());

//转换成16进制
StringBuffer hexString = new StringBuffer();
for (int i = 0; i < sign.length; i++) {
  String hex = Integer.toHexString(0xff & sign[i]);
  if (hex.length() == 1)
    hexString.append('0');
  hexString.append(hex);
}
```

#### AES 对称加密
```java
String contentNeedToBeEncrypted = "contentNeedToBeEncrypted";
String key = "aabbccddeeffgghh";//private key
String iv = "aabbccddeeffgghh";//偏移量，可以设置成和私钥为同一个值
Key keySpec = new SecretKeySpec(key.getBytes(), "AES");

//加密
Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
IvParameterSpec ivSpec = new IvParameterSpec(iv.getBytes());
cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivSpec);
byte [] b = cipher.doFinal(params.getBytes());
String result = Base64.encodeBytes(b);

//解密
String contentNeedToBeDecrypted = "contentNeedToBeDecrypted";
Cipher cipher1 = Cipher.getInstance("AES/CBC/PKCS5PADDING");
IvParameterSpec ivSpec1 = new IvParameterSpec(iv.getBytes()); 
byte [] bytes = Base64.decode(contentNeedToBeDecrypted);
cipher1.init(Cipher.DECRYPT_MODE, keySpec, ivSpec1);
byte [] retB = cipher1.doFinal(bytes);
System.out.println(new String(retB, "utf-8"));
```
