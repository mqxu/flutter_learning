// class Person {
//   static String name = '张三';
//
//   static void show() {
//     print(name);
//   }
// }

class Person {
  static String name = '张三';
  int age = 20;

  static void show() {
    print(name);
  }

  void printInfo() {
    /*非静态方法可以访问静态成员以及非静态成员*/
    print(name); //访问静态属性
    print(age); //访问非静态属性
    show(); //调用静态方法
  }

  static void printUserInfo() {
    //静态方法
    print(name); //静态属性
    show(); //静态方法
    // print(this.age); //静态方法没法访问非静态的属性
    // this.printInfo(); //静态方法没法访问非静态的方法
  }
}

class Person1 {
  String name;
  num age;

  Person1(this.name, this.age);

  void printInfo() {
    print("$name---$age");
  }
}

main() {
  // print(Person.name);
  // Person.show();
  // print(Person.name);
  // Person.show();
  //
  // Person p = Person();
  // p.printInfo();
  //
  // Person.printUserInfo();


  Person1 p1 = Person1('张三', 20);
  p1.printInfo();

  Person1 p2 = Person1('张三', 20);
  if (p2 is Person1) {
    p2.name = "李四";
  }
  p2.printInfo();
  print(p2 is Object);

  Person1 p3 = Person1('张三111', 20);
  p3.printInfo();
  p3.name = '张三222';
  p3.age = 40;
  p3.printInfo();

  Person1 p4 = Person1('张三', 20);
  p4.printInfo();
  p4
    ..name = "李四"
    ..age = 30
    ..printInfo();
}
