class JsonModelDemo {
  String key;
  String value;

  /// jsonDecode(jsonStr) 方法中会调用实体类的这个方法。如果实体类中没有这个方法，会报错。
  Map toJson() {
    Map map = new Map();
    map["key"] = this.key;
    map["value"] = this.value;
    return map;
  }

  /// jsonDecode(jsonStr)方法返回的是Map<String, dynamic>类型，需要这里将map转换成实体类
  static JsonModelDemo fromMap(Map<String, dynamic> map) {
    JsonModelDemo jsonModelDemo = new JsonModelDemo();
    jsonModelDemo.key = map['key'];
    jsonModelDemo.value = map['value'];
    return jsonModelDemo;
  }

  @override
  String toString() {
    return 'JsonModelDemo{key: $key, value: $value}';
  }


}
