import 'dart:convert';

import 'package:dart_demo1/json/json_model.dart';

///  将实体类对象解析成json字符串
String generatePlatformJson({String key, String value}) {
  JsonModelDemo jsonModelDemo = new JsonModelDemo();
  jsonModelDemo.key = key;
  jsonModelDemo.value = value;
  String jsonStr = jsonEncode(jsonModelDemo);
  return jsonStr;
}

/// 将json字符串解析成实体类对象
JsonModelDemo parsePlatformJson(String jsonStr) {
  JsonModelDemo result = JsonModelDemo.fromMap(jsonDecode(jsonStr));
  return result;
}

/// 这里写测试方法
main() {
  String result1 = generatePlatformJson(key: "result1", value: "result1Value");
  print('result1:$result1');

  JsonModelDemo modelDemo = parsePlatformJson(result1);
  print('parsePlatformJson:$modelDemo');
}
