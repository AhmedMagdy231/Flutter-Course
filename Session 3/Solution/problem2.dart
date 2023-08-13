import 'dart:io';

void main(){

  int input = int.parse(stdin.readLineSync()!);

  int result = input*(input+1) ~/ 2;

  print(result);
}