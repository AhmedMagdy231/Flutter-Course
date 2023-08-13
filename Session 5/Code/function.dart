void main(){

greetPerson1(
lastName:  'Magdy',
fistName: 'Ahmed',
);

greetPerson2('Ahmed');

}

void greetPerson1({required String fistName , String? lastName=''}){

  print('Hello ${fistName} ${lastName}');
  
}

void greetPerson2( String fistName , [String? lastName='']){

  print('Hello ${fistName} ${lastName}');
  
}

