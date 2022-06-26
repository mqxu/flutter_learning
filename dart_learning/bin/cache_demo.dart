abstract class ObjectCache {
  getByKey(String key);

  void setByKey(String key, Object value);
}

abstract class StringCache {
  getByKey(String key);

  void setByKey(String key, String value);
}

abstract class Cache<T> {
  getByKey(String key);

  void setByKey(String key, T value);
}

class FileCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print("内存缓存把key=$key，value=$value 写到了内存中");
  }
}

class MemoryCache<T> implements Cache<T> {
  @override
  getByKey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print("内存缓存把key=$key，value=$value 写到了内存中");
  }
}

void main() {
  MemoryCache m = MemoryCache<String>();
  m.setByKey('index', '首页数据');
  MemoryCache m1 = MemoryCache<Map>();
  m1.setByKey('index', {"name": "张三", "age": 20});
}
