int add(int a, int b) {
  return a + b;
}

int test(int a, int b, Function operation) {
  return operation(a, b);
}

main() {
  print(test(5, 2, add));
}