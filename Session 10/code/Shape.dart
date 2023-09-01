//Parent
class Shape{
  void draw(){
    print('This is a shape');
  }
}
//Child
class Square extends Shape{
  @override
  void draw(){
    print('I am a square');
  }
}

void main(){
  Shape s1 = Shape();
  s1.draw();
  Square s = Square();
  s.draw();
}