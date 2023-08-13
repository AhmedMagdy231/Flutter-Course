import 'dart:io';
void main(){
  // Take Price from User
stdout.write("Enter A valid Price: ");
double priceFromUser = double.parse(stdin.readLineSync()!);
// Take Discount Value from User
stdout.write('Enter A valid Discount Value: ');
int discountVal = int.parse(stdin.readLineSync()!);  

double finalPrice = GetFinalPrice(
  price:priceFromUser,
  discount: discountVal
);
print("Final Price is $finalPrice");
}

double GetFinalPrice({
  required double price,
  int discount = 0,
}){
  
 
    return (price  - price * discount /100);
  
}
