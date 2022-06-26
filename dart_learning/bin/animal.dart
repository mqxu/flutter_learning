// 自定义库
class Animal {
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
    _run(); //类里面方法的相互调用
  }
}
