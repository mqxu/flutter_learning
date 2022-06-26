String printUserInfo(String username, int age) {
  return "姓名:$username---年龄:$age";
}

String printUserInfo1(String username, [age1]) {
  if (age1 != null) {
    return "姓名:$username---年龄:$age1";
  }
  return "姓名:$username---年龄:保密";
}

String printUserInfo2(String username, [String sex = '男', int age = 20]) {
  return "姓名:$username---性别:$sex---年龄:$age";
}

String printUserInfo3(String username, {required int age, String sex = '男'}) {
  return "姓名:$username---性别:$sex--年龄:$age";
}

void main() {
  // print(printUserInfo('张三', 20));
  // print(printUserInfo1('张三', 21));
  // print(printUserInfo1('张三'));
  // print(printUserInfo2('张三'));
  // print(printUserInfo2('小李','女'));
  // print(printUserInfo2('小李','女',30));
  print(printUserInfo3('张三', age: 20, sex: '未知'));
}
