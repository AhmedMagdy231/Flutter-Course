
void main(){

  int num1 = 5;
  int? num2;
  num2 = 10;



  int result = num1 + (num2 ?? 6);

  print(result);

}