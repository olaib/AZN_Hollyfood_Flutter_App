import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  const TitleText({
    super.key,
    required this.label,
    this.fontSize = 20,
    this.color,
    this.fontStyle = FontStyle.normal,
    this.decoration = TextDecoration.none,
  });

  final String label;
  final double fontSize;
  final Color? color;
  final FontStyle fontStyle;
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontStyle: fontStyle,
        decoration: decoration,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}