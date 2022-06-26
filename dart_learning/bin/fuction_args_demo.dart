var fn = () {
  print('我是一个匿名方法');
};

fn1() {
  print('fn1');
}

fn2(fn) {
  fn();
}

fn3() {
  List list = ['苹果', '香蕉', '西瓜'];
  list.forEach((value) {
    print(value);
  });
  print('************');
  list.forEach((value) => print(value));
  print('************');
  list.forEach((value) => {print(value)});
}

fn4() {
  List list = [4, 1, 2, 3, 4];
  var newList = list.map((value) {
    if (value > 2) {
      return value * 2;
    }
    return value;
  });
  print(newList.toList());
  var newList1 = list.map((value) => value > 2 ? value * 2 : value);
  print(newList1.toList());
}

bool isEvenNumber(int n) {
  if (n % 2 == 0) {
    return true;
  }
  return false;
}

printNum(int n) {
  for (var i = 1; i <= n; i++) {
    if (isEvenNumber(i)) {
      print(i);
    }
  }
}

int getNum(int n) {
  return n;
}


fn5(int n) {
  if (n == 0) {
    return 0;
  }
  return n + fn5(n - 1);
}

void main() {
  // fn();
  //调用fn2方法 把fn1方法当做参数传入
  // fn2(fn1);
  // fn3();
  // fn4();
  // printNum(10);

//   print(getNum(12));
//   //匿名方法
//   var printNum = () {
//     print(123);
//   };
//   printNum();
//
//   var printNum1 = (int n) {
//     print(n + 2);
//   };
//   printNum1(12);
//
// //自执行方法
//   ((int n) {
//     print(n);
//     print('我是自执行方法');
//   })(12);

  var sum = fn5(100);
  print(sum);
}
