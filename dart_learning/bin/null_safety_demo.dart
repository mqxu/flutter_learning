String getAddress() {
  return "北京市";
}

void demo1() {
  String name = "小明";
  int age = 18;
  String address = getAddress();
  print('demo1:$name,$age,$address');
}

void demo2() {
  String? name;
  int? age;
  String? address;
  print('demo2:$name,$age,$address');
}

void demo3() {
  String? address = getAddress();
  print('demo3:${address.length}');
}

void demo4() {
  String? address = getAddress();
  String newAddress = address ?? "未知";
  print('demo4:$newAddress');
}

void demo5() {
  String? address;
  address ??= "未知";
  print('demo5:$address');
}

void demo6() {
  var a;
  var b = "";
  var c = 0;

  if ([null, "", 0].contains(a)) {
    print(a);
  }
  if ([null, "", 0].contains(b)) {
    print(b);
  }
  if ([null, "", 0].contains(c)) {
    print(c);
  }
}

void main() {
  demo1();
  demo2();
  demo3();
  demo4();
  demo5();
  // demo6();
}
