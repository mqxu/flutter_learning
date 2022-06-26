class Person {
  String name = '张三';
  num age = 20;

  void printInfo() {
    print("$name---$age");
  }
}

class Web extends Person {}

main() {
  Web w = Web();
  print(w.name);
  w.printInfo();
}
