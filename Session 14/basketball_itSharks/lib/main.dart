
import 'package:basketball_itsharks/screen1.dart';
import 'package:flutter/material.dart';


main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasketBallScreen(),
    );
  }
}




