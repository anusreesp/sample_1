import 'package:flutter/material.dart';
import 'package:sample_1/theme.dart';

class NextButton extends StatelessWidget {
  final Function() onTap;
  final Widget widget;
  final double? width;
  final Color? bgColor;
  const NextButton(
      {super.key,
      required this.onTap,
      required this.widget,
      this.bgColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
            width: width,
            decoration: BoxDecoration(
                border: Border.all(color: AppTheme.lightGrey2Color),
                color: bgColor ?? AppTheme.lightGrey2Color,
                borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget,
            )),
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String text;
  final Color? color;
  const IconTextButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.color = AppTheme.lightGrey3Color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color ?? AppTheme.lightGrey2Color)),
              child: Icon(
                icon,
                color: color,
                size: 40,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                color: AppTheme.blackColor,
              ),
            )
          ],
        ));
  }
}
