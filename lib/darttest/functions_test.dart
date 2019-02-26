main() {
  // 正常调用
  enableFlags(bold: false, hidden: false);
  // 参数调换顺序
  enableFlags(hidden: false, bold: false);
  // 只传入第一个
  enableFlags(bold: false);
  // 只传入第二个参数
  enableFlags(hidden: false);

  // 可选位置参数
  // 不调用可选参数
  print('${say("China", "Beijing")}');
  // 调用第一个可选参数
  print('${say("China", "Beijing", "mate 10 pro")}');
  // 调用两个可选参数
  print('${say("China", "Beijing", "mate 20 X", "wangcai")}');

  // 参数默认值——命名参数
  setDefaultValues();
  setDefaultValues(value1: false, value2: "abc", value3: 100, value4: 1000.11);
  setDefaultValues(value1: true);
  setDefaultValues(value2: "tiny");
  setDefaultValues(value3: 1000);
  setDefaultValues(value4: 100.0);
  print('-------------------');

  // 参数默认值——可选参数
  setDefaultValuesToOptional(true,"11111");
  setDefaultValuesToOptional(true,"11111",100);
  setDefaultValuesToOptional(true,"11111",100,1000.0);
  print('-------------------');

  doStuff();
  doStuff(list: [4,5,6],gifts: {"11":"11","22":"22"});
  doStuff(list: [1]);
  doStuff(gifts: {"33":"33"});
}

/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool bold, bool hidden}) {}

// 可选位置参数
String say(String from, String msg, [String device, String name]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device ,';
  }
  if (name != null) {
    result = '$result name: $name';
  }
  return result;
}

// 命名参数设置默认值
void setDefaultValues(
    {bool value1 = true,
    String value2 = "value2",
    int value3 = 10,
    double value4}) {
  print('value1: $value1, value2: $value2, value3: $value3, value4: $value4');
}

// 可选参数设置默认值
void setDefaultValuesToOptional(bool value1, String value2,
    [int value3 = 10, double value4]) {
  print('value1: $value1, value2: $value2, value3: $value3, value4: $value4');
}

void doStuff(
    {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
  print('list:  $list');
  print('gifts: $gifts');
}