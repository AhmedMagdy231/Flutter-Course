void main(){
 Circle c1 = Circle('Circle', 'red', radius: 2.5);
 Rectange r1 = Rectange('Rectange', 'blue', length: 5, width: 3);
 Square s1 = Square('Square', 'White', side: 10);

 print(c1.getArea());
 print(r1.getArea());
 print(s1.getArea());
 
}

 abstract class Shape {
  late String name;
  late String color;

  Shape({required this.name,required this.color});

   double getArea();



}


class Circle extends Shape{

  double radius;

  Circle(String name, String color,{required this.radius}):super(name: name,color: color);

  @override
  double getArea() {
   double result = 3.14 * this.radius * this.radius;
   return result;
  }

 

}


class Rectange extends Shape{

  double length;
  double width;

  Rectange(String name, String color,{required this.length,required this.width}):super(name: name,color: color);

  @override
  double getArea() {
   double result = this.length * this.width;
   return result;
  }

}


class Square extends Shape{

 double side;

  Square(String name, String color,{required this.side}):super(name: name,color: color);

  @override
  double getArea() {
   double result = this.side * this.side;
   return result;
  }

}