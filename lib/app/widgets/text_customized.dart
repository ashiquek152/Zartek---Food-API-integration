import 'package:flutter/material.dart';

class TextCustomized extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const TextCustomized({
    Key? key,
    required this.fontSize,
    required this.text,
    this.fontWeight=FontWeight.normal,
    this.textColor = Colors.black,
    this.textAlign =TextAlign.start
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: textAlign,
      
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: "Ubuntu",
      ),
    );
  }
}