T getData<T>(T value) {
  return value;
}

void main() {
  print(getData(21));
  print(getData('hello'));
  print(getData<String>('你好'));
  print(getData<int>(12));
}
