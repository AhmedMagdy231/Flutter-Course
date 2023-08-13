import 'dart:io';
void main(){
  int num1,num2;
  //Take Input From User
  while(true){
   stdout.write('Enter First Number: ');
  num1 = int.parse(stdin.readLineSync()!);
  stdout.write('Enter Second Number: ');
  num2 = int.parse(stdin.readLineSync()!);
  stdout.write('Enter Valid Operation (+,-,/,*): ');
  String op = stdin.readLineSync()!;
  if(op == 'q') break;
  calculator(num1,num2,op);
  }
  
}

//Sum Fn
int sum (int num1,int num2){
  return num1 + num2;
}

//Subtract Fn
int subtract(int num1, int num2){
  return num1 - num2;
}

//Multiplication Fn
int multiplication (int num1 , int num2){
  return num1 * num2;
}

// Divison Fn
int? division (int num1 , int num2){
  try{
    return num1 ~/ num2;
  }
  catch(error){
    print(error.toString());
    return null;
  }
}


//Calculator Fn
void calculator(int num1 , int num2 , String op){

  try{
  
  switch(op){
    case '+':{
      int result = sum(num1, num2);
      print("Sum result is $result");
      break;
    }
    case '-':{
      int result = subtract(num1, num2);
      print("Subtract result is $result");
      break;
    }
    case '*':{
       int result = multiplication(num1, num2);
      print("Multiplication result is $result");
      break;
    }
    case '/':{
      int? result = division(num1, num2);
      if(result != null){
      print("Division result is $result");
      }
      break;
    }
    default:{
      print("Enter Valid Operator");
      break;
    }
  }
  }catch(error){
    print('Enter Valid Number');
  }
  
}


