import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildText extends StatelessWidget {
  late String text;
  late Color color;
  bool isBold;
  late double size;

  BuildText({
    required this.text,
    required this.color,
    required this.size,
     this.isBold = false,
});


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: size,
        color: color,
        fontWeight: isBold? FontWeight.bold: null,
      ),
    );
  }
}
