
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.purple,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ),
              Column(

                children: [
                  Container(
                    width: 200,
                    height: 50,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 200,
                    height: 150,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),

          Container(
            width: double.infinity,
            height: 200,
            color: Colors.purple,
          ),
        ],
      ),

    );
  }
}

