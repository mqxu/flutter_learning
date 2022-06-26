// class Person {
//   String name;
//   num age;
//
//   Person(this.name, this.age);
//
//   void printInfo() {
//     print("$name---$age");
//   }
//
//   work() {
//     print("$name在工作...");
//   }
// }
//
// class Web extends Person {
//   Web(String name, num age) : super(name, age);
//
//   run() {
//     print('run');
//   }
//
//   //覆写父类的方法,@override 可以省略，不过建议在覆写父类方法的时候加上 @override
//   @override
//   void printInfo() {
//     print("姓名：$name---年龄：$age");
//   }
//
//   @override
//   work() {
//     print("$name的工作是写代码");
//   }
// }

class Person {
  String name;
  num age;

  Person(this.name, this.age);

  void printInfo() {
    print("$name---$age");
  }

  work() {
    print("$name在工作...");
  }
}

class Web extends Person {
  Web(String name, num age) : super(name, age);

  run() {
    print('run');
    super.work(); //子类调用父类的方法
  }

  @override
  void printInfo() {
    print("$name---$age");
  }
}

void main() {
  // Web w = Web('李四', 20);
  //
  // w.printInfo();
  //
  // w.work();

  Web w = Web('李四', 20);
  w.run();
}
