/// 变量声明
main() {
  var t;
  t = "hi world";

  t = true;
  print('t:$t');

  dynamic d;
  d = "hello dynamic";
  d = 1000;
  print('d:$d');

  final finalStr = "hi final";
  const constStr = "hello const";
  print('finalStr:$finalStr');
  print('constStr:$constStr');
}
