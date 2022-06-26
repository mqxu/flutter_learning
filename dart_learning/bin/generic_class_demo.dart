// class PrintClass {
//   List list = <int>[];
//
//   void add(int value) {
//     list.add(value);
//   }
//
//   void printInfo() {
//     for (var i = 0; i < list.length; i++) {
//       print(list[i]);
//     }
//   }
// }

class PrintClass<T> {
  List list = <T>[];

  void add(T value) {
    list.add(value);
  }

  void printInfo() {
    for (var i = 0; i < list.length; i++) {
      print(list[i]);
    }
  }
}

void main() {
  PrintClass p1 = PrintClass<String>();
  p1.add('abc');
  // p1.add(123); // 报错，因为不符合泛型类中指定的String泛型
  p1.add('xyz');
  p1.printInfo();

  PrintClass p2 = PrintClass<int>();
  p2.add(12);
  p2.add(34);
  p2.printInfo();
}
