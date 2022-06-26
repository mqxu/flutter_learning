void expressionDemo() {
//1、Dart运算符：
//   - 算术运算符：+、 - 、* 、  / 、  ~/ (取整)  、%（取余）
//   - 关系运算符：==  、  ！=、   >  、  <、    >=  、  <=
//   - 逻辑运算符：! 、 &&、   ||
//   - 赋值运算符
//   - 基础赋值运算符：   = 、  ??=
//   - 复合赋值运算符：   += 、 -=、  *=  、 /=  、 %= 、 ~/=
//   - 条件表达式：if  else   switch case
//   - 三目运算符
//   - ??运算符

//2、类型转换
//   - Number与String类型之间的转换
//   - 其他类型转换成Boolean类型

  //算术运算符
  int a = 13;
  int b = 5;
  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a % b);
  print(a ~/ b);
  var c = a * b;
  print(c);
  print('----------------');


  //关系运算符
  a = 5;
  b = 3;
  print(a == b);
  print(a != b);
  print(a > b);
  print(a < b);
  print(a >= b);
  print(a <= b);
  if (a > b) {
    print('a大于b');
  } else {
    print('a小于b');
  }
  print('----------------');

  //逻辑运算符
  bool flag = false;
  print(!flag);
  bool flag1 = true;
  bool flag2 = true;
  print(flag1 && flag2);
  bool flag3 = false;
  bool flag4 = false;
  print(flag3 || flag4);
  // 指定条件输出
  int age = 20;
  String sex = "女";
  if (age == 20 && sex == "女") {
    print("$age --- $sex");
  } else {
    print("不打印");
  }
  print('----------------');

  // 基础赋值运算符 : = , ??=
  int num1 = 10;
  int num2 = 3;
  int num3 = 0;
  num3 = num1 + num2;
  print('num3 = $num3');

  // ??=： 如果变量没有赋值才进行赋值，否则不进行赋值
  var i = 2;
  var j = i ?? 10;  // i已经被赋值，所以j的值不会执行 ?? 后面的10
  print('j = $j');  // j = 2

  var g;
  var k = g ?? 10;  // g没有被赋值，所以k的值会执行 ?? 后面的10
  print('k = $k');  // k = 10


  // 复合的赋值运算符   +=  -=  *=   /=   %=  ~/=
  var aa = 12;
  aa = aa + 10;
  print('aa = $aa');

  var ab = 13;
  ab += 10;
  print('ab = $ab');

  var ac = 4;
  ac *= 3;
  print('ac = $ac');
  print('----------------');

  //条件表达式
  //if  else   switch case
  bool f = true;
  if (f) {
  print('true');
  } else {
  print('false');
  }

  //多重 if else
  var score = 41;
  if (score > 90) {
  print('优秀');
  } else if (score > 70) {
  print('良好');
  } else if (score >= 60) {
  print('及格');
  } else {
  print('不及格');
  }
  // switch
  var gender = "女";
  switch (gender) {
  case "男":
  print('性别是男');
  break;
  case "女":
  print('性别是女');
  print('性别是女');
  break;
  default:
  print('传入参数错误');
  break;
  }

  // 三目运算符
  var res = true;
  String res1 = res ? '结果是true' : '结果是false';
  print('res1 = $res1');
  print('----------------');

  // ?? 运算符
  var x;
  var y = x ?? 10;
  print('y= $y');
  var xx = 22;
  var yy = xx ?? 10;
  print('yy= $yy');
  print('----------------');

  //类型转换
  //1、Number与String类型之间的转换
  // Number类型转换成String类型 toString()
  // String类型转成Number类型  int.parse()
  String str = '123';
  var myNum = int.parse(str);
  print('myNum = $myNum');
  print(myNum is int);

  String str1 = '123.1';
  var myNum1 = double.parse(str1);
  print('myNum1 = $myNum1');
  print(myNum1 is double);

  String price = '12';
  var myNum2 = double.parse(price);
  print('myNum2 = $myNum2');
  print(myNum2 is double);

  //报错
  // String price1 = '';
  // var myNum3 = double.parse(price1);
  // print('myNum3 = $myNum3');
  // print(myNum3 is double);

  // 捕获异常，程序可以正常执行
  String price2 = '';
  try {
  var myNum4 = double.parse(price2);
  print('myNum4 = $myNum4');
  } catch (err) {
  print('程序出错');
  }

  var myNum5 = 12;
  var ss = myNum5.toString();
  print('ss = $ss');
  print(ss is String);
  print('----------------');

// 2、其他类型转换成Booleans类型
  // isEmpty:判断字符串是否为空
  var str2 = '';
  if (str2.isEmpty) {
  print('str2为空');
  } else {
  print('str2不为空');
  }

  var myNum6 = 123;
  if (myNum6 == 0) {
  print('0');
  } else {
  print('非0');
  }

  var myNum7;
  if (myNum7 == 0) {
  print('0');
  } else {
  print('非0');
  }

  var myNum8;
  if (myNum8 == null) {
  print('空');
  } else {
  print('非空');
  }

  var myNum9 = 0 / 0;
  print('myNum = $myNum');
  if (myNum9.isNaN) {
  print('NaN');
  }
}
