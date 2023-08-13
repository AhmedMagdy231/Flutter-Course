import 'dart:io';

void main(){

  int input = int.parse(stdin.readLineSync()!);

  if(input % 2 ==0)
  {
    print('Number is Even');
  }
  else
  {
    print('Number is Odd');
  }




}