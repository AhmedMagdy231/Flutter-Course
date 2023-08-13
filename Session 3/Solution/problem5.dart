import 'dart:io';
void main(){
  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  int c = int.parse(stdin.readLineSync()!);
  int d = int.parse(stdin.readLineSync()!);

  int result = a*b*c*d; // 280
  String outputLast = (result % 10).toString(); //0
  result ~/= 10; //28
   String outputFirst = (result % 10).toString(); //8
  print(outputFirst + outputLast);



}