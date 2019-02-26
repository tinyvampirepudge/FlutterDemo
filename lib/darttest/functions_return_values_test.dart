foo() {}

void baz() {}

main() {
  assert(foo() == null);
//  assert(baz() == null);// 编译器异常
}
