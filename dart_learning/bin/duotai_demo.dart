//多态
abstract class Animal {
  eat(); //抽象方法
}

class Dog extends Animal {
  @override
  eat() {
    print('小狗在吃骨头');
  }

  run() {
    print('run');
  }
}

class Cat extends Animal {
  @override
  eat() {
    print('小猫在吃老鼠');
  }

  run() {
    print('run');
  }
}

main() {
  Animal d = Dog();
  d.eat();
  Animal c = Cat();
  c.eat();
}
