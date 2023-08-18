

 
void main(){


 greetPerson('Ahmed',sayHi );

}

final sayHi = (String name)  => 'hi $name';

void greetPerson(String namee, String  Function(String) fun){

  print(fun(namee));
}



// many parameter
// optional parameter
// named parameter
// take function as parameter

