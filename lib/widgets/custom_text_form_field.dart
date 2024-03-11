import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String regExp;
  final String formate;
  final String hintText;
  final bool obscureText;
  final Function(String?) onSaved;

  const CustomTextFormField(
      {super.key,
      required this.regExp,
      required this.hintText,
      required this.obscureText,
      required this.onSaved,
      required this.formate});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(18, 255, 255, 255),
        filled: true,
        labelText: hintText,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
      ),
      obscureText: obscureText,
      validator: (value) => RegExp(regExp).hasMatch(value!) ? null : formate,
      onSaved: (val) => onSaved(val),
    );
  }
}
