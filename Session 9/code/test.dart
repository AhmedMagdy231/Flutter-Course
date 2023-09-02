void main(){


  Complex c3 = Complex(real: 1, imagnery: 1);

  Complex idenity = Complex.Identity();
  Complex number = Complex.zero();



}

class Complex{
  double? real;
  double? imagnery;

  Complex({required this.real,required this.imagnery});

  Complex.Identity(){
    this.imagnery = 1;
    this.real = 1;
  }

  Complex.zero(){
    this.imagnery= 0;
    this.real =0;
  }
}