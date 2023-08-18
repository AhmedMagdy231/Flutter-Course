void main(){
 
 greetPerson(
   firstName: 'Ahmed',
   secondName: 'Magdy',
   age: 21,

 );


}

void greetPerson({required String firstName, String? secondName = '',int? age}){
  print('Hello $firstName $secondName');
}


