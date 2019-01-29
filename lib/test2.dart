/// 函数
main() {
  var say = (str) {
    print(str);
  };

  say("Hi world");

  execute(() => print("xxx"));

  var result1 = say1('Bob', 'Howdy');
  print(result1);
  var result2 = say1('Bob', 'Howdy', 'smoke singal');
  print(result2);

  enableFlags(bold: true,hidden: false);
}

typedef bool CALLBACK();

void test(CALLBACK cb) {
  print(cb());
}

void execute(var callback) {
  callback();
}

String say1(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void enableFlags({bool bold, bool hidden}) {
  print('I\'m fine, Thanks.');
}
