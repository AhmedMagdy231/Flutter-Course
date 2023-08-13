
void main(){

  int num = 20;

  if(isPrime(num))
  {
    print('Prime');
  }
  else
  {
    print('Not Prime');
  }


}

bool isPrime(int number){

  
    for(int i=2; i < number ; i++){

    if(number % i == 0){

     return false;
    
    }
  }

  return true;

}







