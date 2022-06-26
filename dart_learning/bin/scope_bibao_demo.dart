//全局变量
var a = 123;

void main() {
  print(a);  // 123

  fn() {
    a++;
    print(a);  //124
  }

  fn();

  //局部变量
  printInfo() {
    var myNum = 123;
    myNum++;
    print(myNum);  // 124
  }

  printInfo();  // 124

  //闭包
  // 不会污染全局 常驻内存
  fn1() {
    var a = 123;
    return () {
      a++;
      print(a);
    };
  }

  var b = fn1();
  b();  // 124
}
