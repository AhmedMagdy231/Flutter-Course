
import 'dart:io';
import 'dart:math';
enum Move {rock,scissors,paper}

void main(){

while (true){
  Random r = Random();
  stdout.write("Enter Rock/Scissor or Paper : ");
  final input = stdin.readLineSync()!;

  if(input == 'r' || input == 's' || input == 'p')
  {
       Move playerMove;
       if(input == 'r') 
       {
        playerMove = Move.rock;
       }
       else if(input == 's')
       {
        playerMove = Move.scissors;
       }
       else 
       {
         playerMove = Move.paper;
       }
      
       final random = r.nextInt(3);
       Move playerAiMove = Move.values[random];

       print("you playe  ${playerMove}");
       print("Ai playe ${playerAiMove}");

       if(playerMove == playerAiMove)
       {
        print('Draw');
       }
       else if(
        playerMove == Move.rock && playerAiMove == Move.scissors || playerMove==  Move.paper&& playerAiMove == Move.rock|| playerMove == Move.scissors && playerAiMove == Move.paper)
        {
           print('You Win');
        }
        else 
        {
          print('Your lose');
        }
  }
  else if(input == 'q')
  {
    break;
  }
  else
  {
    print('Please Enter Valid Character');
  }

}

}