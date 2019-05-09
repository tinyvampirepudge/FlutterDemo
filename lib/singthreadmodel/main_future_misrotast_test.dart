import 'dart:async';

/// Flutter main future microTask 的执行顺序
main() {
  print('main 111');

  scheduleMicrotask(() => print('microtask 111'));

  Future.delayed(Duration(seconds: 1), () => print('future 111 delayed'));

  Future(() => print('future 222'));

  Future(() => print('future 333'));

  scheduleMicrotask(() => print('mocrotask 222'));

  print('main 222');
}
