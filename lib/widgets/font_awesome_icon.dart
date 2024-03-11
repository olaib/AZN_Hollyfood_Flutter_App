import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesome extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const FontAwesome({
    super.key,
    required this.icon,
    this.size = 24,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      size: size,
      color: color,
    );
  }
}
 