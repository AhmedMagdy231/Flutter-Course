import 'dart:math';
enum Game {rock,scissors,paper}
void main(){
  Random rand = Random();
  int index = rand.nextInt(3);
  print(index);
  print(Game.values[index]);
}