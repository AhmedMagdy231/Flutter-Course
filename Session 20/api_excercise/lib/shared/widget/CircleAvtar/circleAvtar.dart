import 'package:flutter/material.dart';

class BuildCircleAvtar extends StatelessWidget {
  late double radius;
  late String image;
  late Color color;
   BuildCircleAvtar({
    required this.radius,
     required this.image,
     required this.color
});

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: radius,
      backgroundColor: color,
      backgroundImage: NetworkImage(
        image,
      ),
    );
  }
}
