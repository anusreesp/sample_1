import 'package:flutter/material.dart';
import 'package:sample_1/theme.dart';

class BorderTextField extends StatelessWidget {
  final Function(String)? onchanged;
  final String hintText;
  final EdgeInsetsGeometry? padding;

  const BorderTextField(
      {super.key,
      required this.onchanged,
      required this.hintText,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: onchanged,
        style: const TextStyle(color: AppTheme.lightGrey2Color),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppTheme.lightGrey2Color),
            fillColor: AppTheme.lightGrey1Color,
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGrey2Color)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGrey2Color)),
            focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 188, 188, 188)))),
      ),
    );
  }
}
