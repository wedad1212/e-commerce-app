// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextStyle extends StatelessWidget {
  CustomTextStyle(
 
      {super.key,
   this.maxLine=1,
      required this.text,
      required this.textAlign,
      required this.fontSize,
      required this.color,
      required this.alignmentGeometry});
  final String text;
  final TextAlign textAlign;
  final double fontSize;
  final Color color;
  int maxLine;
  final AlignmentGeometry alignmentGeometry;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignmentGeometry,
      child: Text(
        text,
        maxLines: maxLine,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.bold),
      ),
    );
  }
}
