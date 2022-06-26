int getSum(int n) {
  var sum = 0;
  for (var i = 1; i <= n; i++) {
    sum += i;
  }
  return sum;
}

void main() {
  var n1 = getSum(5);
  print(n1);
  var n2 = getSum(100);
  print(n2);
}
