import 'package:flutter/material.dart';
import 'package:sample_1/theme.dart';
import 'dart:ui' as ui;

class NeedleHorizontal extends StatelessWidget {
  final double width, height;
  final bool flip;
  const NeedleHorizontal(
      {super.key,
      required this.width,
      required this.height,
      this.flip = false});

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: flip,
      child: CustomPaint(
        size: Size(width, height),
        painter: NeedlePaintHorizontal(),
      ),
    );
  }
}

class NeedlePaintHorizontal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint()
      ..color = AppTheme.lightGrey3Color
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
          const Offset(0, 0),
          Offset(size.width, size.height),
          [AppTheme.lightGrey3Color, Colors.transparent]);

    path.moveTo(0, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
