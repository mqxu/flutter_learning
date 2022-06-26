//异步方法
testAsync() async {
  return 'Hello async';
}

void main() async {
  var result = await testAsync();
  print(result);
}
