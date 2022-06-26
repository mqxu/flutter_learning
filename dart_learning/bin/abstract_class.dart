abstract class Animal {
  eat(); //抽象方法
  run(); //抽象方法
  printInfo() {
    print('我是一个抽象类里面的普通方法');
  }
}

class Dog extends Animal {
  @override
  eat() {
    print('小狗在吃骨头');
  }

  @override
  run() {
    print('小狗在跑');
  }
}

class Cat extends Animal {
  @override
  eat() {
    print('小猫在吃老鼠');
  }

  @override
  run() {
    print('小猫在跑');
  }
}

main() {
  Dog d = Dog();
  d.eat();
  d.printInfo();

  Cat c = Cat();
  c.eat();

  c.printInfo();

  // Animal a = Animal();   //抽象类没法直接被实例化
}
