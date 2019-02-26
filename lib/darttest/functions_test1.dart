main() {
//  var list = [1, 2, 3];
//
//  // Pass printElement as a parameter.
//  list.forEach(printElement);
//
//  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
//  assert(loudify('hello') == '!!! HELLO !!!');

  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) => print('${list.indexOf(item)}: $item'));
}

void printElement(int element) {
  print(element);
}
