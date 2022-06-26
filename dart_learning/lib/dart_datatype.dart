void datatypeDemo() {
  // var clapping = '\u{1f44f}';
  // print(clapping);
  // print(clapping.codeUnits);
  // print(clapping.runes.toList());
  //
  // Runes input = Runes('\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  // print(String.fromCharCodes(input));

  //Dart数据类型：字符串类型
  //1、字符串定义的几种方式
  var str1 = 'this is str1';
  var str2 = "this is str2";
  print(str1);
  print(str2);

  String str3 = 'this is str3';
  String str4 = "this is str4";
  print(str3);
  print(str4);

  String str5 = '''
     this is str5
     this is str5
     this is str5; ''';
  print(str5);

  String str6 = '''
     this is str1
     this is str1
     this is str1
     ''';
  print(str6);

  //2、字符串的拼接
  String str7 = '你好';
  String str8 = 'Dart';
  print("$str1 $str2");
  print(str1 + str2);
  print(str1 + " " + str2);

  //Dart数据类型：数值类型 int 、double
  //1、int ： 必须是整型
  int a = 123;
  a = 45;
  print(a);

  //2、double ： 既可以是整型， 也可是浮点型
  double b = 23.5;
  b = 24;
  print(b);

  //Dart数据类型：布尔类型 bool 值true/false
  bool flag1 = true;
  print(flag1);
  bool flag2 = false;
  print(flag2);

  //3、运算符
  // + - * / %
  var c = a + b;
  print(c);

  //4、条件判断语句
  var flag = true;
  if (flag) {
    print('真');
  } else {
    print('假');
  }

  var num = 123;
  var s = '123';
  if (num == s) {
    print(' num == s');
  } else {
    print(' num != s');
  }

  var num1 = 123;
  var s1 = 123;
  if (num1 == s1) {
    print(' num1 == s1');
  } else {
    print(' num1 != s1');
  }

  //Dart数据类型： List（数组/集合）
  //1、第一种定义List的方式：定义的同时初始化
  var list1 = ['aaa', 'bbb', 'ccc'];
  print(list1);
  print(list1.length);
  print(list1[1]);

  //2、第二种定义List的方式：先定义，再添加元素
  var list2 = [];
  list2.add('张三');
  list2.add(123);
  list2.add(true);
  print(list2);
  print(list2[2]);

  //3、定义List并指定元素类型
  var list3 = <String>[];
  list3.add('张三');
  list3.add('李四');
  // list3.add(123);  // 报错
  print(list3);

  //Dart数据类型： Map（字典）
  //第一种定义 Map 的方式：定义的同时初始化
  var person = {
    "name": "张三",
    "age": 20,
    "work": ["程序员", "送外卖"]
  };
  print(person);
  print(person["name"]);
  print(person["age"]);
  print(person["work"]);

  //第二种定义 Map 的方式：先定义，再以键值对的方式赋值
  var person1 = {};
  person1["name"] = "李四";
  person1["age"] = 22;
  person1["work"] = ["程序员", "送外卖"];
  print(person1);
  print(person1["age"]);

 // dynamic类型
  dynamic d = 'CSDN';
  // 打印运行时类型
  print(d.runtimeType);  //String
  // 类型判断
  print(d is String);  //true
}
