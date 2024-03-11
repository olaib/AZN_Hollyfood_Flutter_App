import 'package:azn_hollyfood_flutter_app/utils/constants.dart';
import 'package:azn_hollyfood_flutter_app/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyAppName extends StatelessWidget {
  const MyAppName({
    super.key,
    this.label = APP_NAME,
    this.fontSize = 30,
    this.duration = 18,
    required this.color,
    required this.baseColor,
    required this.highlightColor,
  });
  final double fontSize;
  final String label;
  final Color color;
  final int duration;
  final Color baseColor;
  final Color highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: duration),
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        children: [
          TitleText(
            label: label,
            fontSize: fontSize,
            color: color,
          ),
        ],
      ),
    );
  }
}
