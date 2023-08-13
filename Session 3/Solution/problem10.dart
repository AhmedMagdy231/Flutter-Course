import 'dart:io';
void main(){
  int number = int.parse(stdin.readLineSync()!);

  number ~/= 1000;

  if(number % 2 ==0)
  {
    print('EVEN');
  }
  else
  {
    print('ODD');
  }
}