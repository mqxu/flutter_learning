import 'scope_bibao_demo.dart';

class Animal {
  //私有属性
  final String _name;
  int age;

  //默认构造函数的简写
  Animal(this._name, this.age);

  void printInfo() {
    print("$_name----$age");
  }

  String getName() {
    return _name;
  }

  void _run() {
    print('这是一个私有方法');
  }

  execRun() {
    //类里面方法的相互调用
    _run();
  }
}

// class Person {
//   String name = "张三";
//   int age = 23;
//
//   void getInfo() {
//     print("$name----$age");
//   }
//
//   void setInfo(int age) {
//     this.age = age;
//   }
// }

// class Person {
//   String name = '张三';
//   int age = 20;
//
//   //默认构造函数
//   Person() {
//     print('这是构造函数里面的内容,这个方法在实例化的时候触发');
//   }
//
//   void printInfo() {
//     print("$name----$age");
//   }
// }

class Person {
  String name;
  int age;

  //默认构造函数的简写
  Person(this.name, this.age);

  Person.now(this.name, this.age) {
    print('我是命名构造函数');
  }

  Person.setInfo(this.name, this.age);

  void printInfo() {
    print("$name----$age");
  }
}

class Rect {
  int height;
  int width;

  Rect()
      : height = 2,
        width = 10 {
    print("$height---$width");
  }

  getArea() {
    return height * width;
  }
}

void main() {
  // Object a = 123;
  // Object v = true;
  // print(a);
  // print(v);
  // var animal = Animal('小狗', 1);
  // print(animal);
  // print(animal._name);
  // print(animal.age);
  // animal.execRun();

  //实例化

  // var p1=new Person();
  // print(p1.name);
  // p1.getInfo();

  // Person p1 = Person();
  // p1.printInfo();

  // var d = DateTime.now(); //实例化DateTime调用它的命名构造函数
  // print(d);


  Person p1 = Person('张三', 20); //默认实例化类的时候调用的是 默认构造函数
  Person p2 = Person.now('李四',22); //命名构造函数
  Person p3 = Person.setInfo('王五', 24);
  p1.printInfo();
  p2.printInfo();
  p3.printInfo();

  // Rect r = Rect();
  // print(r.getArea());
}
