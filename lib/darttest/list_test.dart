main() {
  var constantList = const [1, 2, 3];
  // constantList 指向的是一个常量，我们不能给它添加元素（不能修改它）
//  constantList[1] = 1;       // error
  // constantList 本身不是一个常量，所以它可以指向另一个对象
  constantList = [4, 5, 6];     // it's fine
}
