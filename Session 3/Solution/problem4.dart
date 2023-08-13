import 'dart:io';

void main(){

  int input = int.parse(stdin.readLineSync()!);


  int year = input ~/ 365;

  input -= year*365 ;

  int month = input ~/ 30;

  input -= month*30;

  int day = input;

  print("$year Years");
  print("$month Monthes");
  print("$day Days");



  
}