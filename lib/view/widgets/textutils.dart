import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String txt;
  final Color clr;
  final double fontSize;
  final FontWeight fontWeight;
  const TextUtils({
    Key? key,
    required this.clr,
    required this.txt,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: clr,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ));
  }
}
