```python
# use "requests" to call baidu api
import requests
# use "json" to convert response from baidu api
import json
# use "pinyin" to convert chinese to pinyin #https://github.com/mozillazg/python-pinyin
from pypinyin import pinyin, lazy_pinyin, Style

# Read cities from file
cityfile = open("C:\\allcitys.txt",'r', encoding='UTF-8');
# Read lines from city file
line = cityfile.readline()
while line:
    # split string to array by space (default is space)
    line = line.replace("\n", "").split()
    city = line[0]
    province = line[1]
    # BaiduApiAK is the baidu api access key, you can get it from Baidu
    url = 'http://api.map.baidu.com/geocoder/v2/?address=' + city + '&output=json&ak=BaiduApiAK'
    # print(url)
    # Send request and get response from Baidu
    r = requests.get(url)
    # Load response as JSON
    city_json = json.loads(r.content)
    
    try:
        print("('"+ city + "','"+ province +"','" \
              + str(city_json['result']['location']['lng']) + str("','") \
              + str(city_json['result']['location']['lat']) + str("','") \
              + ''.join(lazy_pinyin(city)) + str("'),"))
    # If get result failed, it will throw KeyError exception
    except KeyError:
        print(line + ":获取经纬度失败")
    
    line = cityfile.readline()
# Close file
cityfile.close()
```
