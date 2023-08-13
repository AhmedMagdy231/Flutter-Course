import 'dart:io';
import 'dart:math';

void main(){

  int r = int.parse(stdin.readLineSync()!);

  double result = 3.14 * pow(r, 2);
  print("${result}");
  
}