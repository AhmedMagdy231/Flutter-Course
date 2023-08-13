
import 'dart:io';

import 'dart:math';
enum Game {paper,scissors,rock}
void main(){

  Random rand = Random();

while(true){
 
  stdout.write("Please Enter (Rock,Paper,Scissors) : ");
  String input = stdin.readLineSync()!;
  input = input.toLowerCase();
  Game player;
  if(input == 's' || input == 'r' || input == 'p')
  {
    
    if(input == 's')
    {
      player = Game.scissors;
    }
    else if ( input == 'p')
    {
      player = Game.paper;
    }
    else 
    {
      player = Game.rock;
    }

  Game computer;
  int index  = rand.nextInt(3);
  computer = Game.values[index];

  if(player == computer)
  {
     print(player);
     print(computer);

     print('Draw');
  }
  else if ( player == Game.scissors && computer == Game.paper || player == Game.paper && computer == Game.rock || player == Game.rock && computer == Game.scissors  )
  {
    print(player);
     print(computer);

     print('You Win');
  }
  else 
  {
       print(player);
     print(computer);

     print('You Lose');
  }
  }
  else if( input == 'q')
  {
    break;
  }
  else 
  {
    print('Please Enter Vaild character!!');
  }




}





}