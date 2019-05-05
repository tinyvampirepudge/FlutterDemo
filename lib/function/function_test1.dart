/// https://www.reddit.com/r/dartlang/comments/bemub7/in_dart_what_does_passing_a_function_or_a_class/

int add(int a, int b) {
  return a + b;
}

int add1(int a, int b,int c) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

int test(int a, int b, Function operation) {
  return operation(a, b);
}

main() {
  print(test(5, 2, add));
  print(test(5, 2, add1));
  print(test(5, 2, subtract));
}