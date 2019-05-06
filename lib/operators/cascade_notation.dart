class Student {
  String string;

  void testMethod() {
    print("This is a  test method");
  }

  void testMethod1() {
    print("This is a  test method1");
  }

  String printString() {
    print("string: $string");
    return string;
  }
}

main() {
  var student = Student();
  student.testMethod();
  student.testMethod1();
  student.string = "猫了个咪";
  student.printString();
}
