import 'dart:io';
void main(){

  int startLine1 = int.parse(stdin.readLineSync()!);
  int endLine1 = int.parse(stdin.readLineSync()!);
  int startLine2 = int.parse(stdin.readLineSync()!);
  int etartLine2 = int.parse(stdin.readLineSync()!);

  if(startLine2 > endLine1)
  {
     print('-1');
  }
  else
  {
    print('$startLine2  $endLine1');
  }

}