import 'dart:io';
​
void main() {
  int n, i, z, l, k;
  print('enter the number of elements');
  n = int.parse(stdin.readLineSync());
  List<int> numbers = List();
  for (i = 0; i < n; i++) numbers.add(int.parse(stdin.readLineSync()));
  for (z = 0; z < n; z++) {
    i = 0;
    k = numbers[z];
    while (k!=0) {
      k =(k ~/ 10);
      i++;
    }
    print(l);
  }
}
​