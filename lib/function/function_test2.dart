/// 方法当做参数传递给另一个方法

void printElement(int element) {
  print(element);
}

main() {
  var list = [1, 2, 3];

// Pass printElement as a parameter.
  list.forEach(printElement);
}
