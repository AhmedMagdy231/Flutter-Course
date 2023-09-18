
import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorScreen extends StatefulWidget {
  const RandomColorScreen({Key? key}) : super(key: key);

  @override
  State<RandomColorScreen> createState() => _RandomColorScreenState();
}

class _RandomColorScreenState extends State<RandomColorScreen> {

  List<Color> myColors = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.green,
  ];

  List<String> colorName = [
    'Blue',
    'Red',
    'Orange',
    'Green'
  ];

  Random rand = Random();
  int index  = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        centerTitle: true,
        backgroundColor: myColors[index],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              colorName[index],
              style: TextStyle(
                fontSize: 30,
                color: myColors[index],
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: myColors[index],
            ),
            MaterialButton(
              onPressed: (){



                setState(() {
                  index = rand.nextInt(myColors.length);

                });



              },
              child: Text('Change Color'),
              color: myColors[index],

            ),
          ],
        ),
      ),
    );
  }
}
