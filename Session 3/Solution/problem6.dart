import 'dart:io';


void main(){
  
 int num1 = int.parse(stdin.readLineSync()!);
 String sign = stdin.readLineSync()!;
 int num2 = int.parse(stdin.readLineSync()!);

 switch(sign){
  case '>':
  {
    if(num1 > num2)
    {
      print('Right');
    }
    else
    {
      print('Wrong');
    }
    break;
  }

  case '<':
    {
    if(num1 < num2)
    {
      print('Right');
    }
    else
    {
      print('Wrong');
    }
    break;
  }

  case '=':
    {
    if(num1 == num2)
    {
      print('Right');
    }
    else
    {
      print('Wrong');
    }
    break;
  }

 }


}