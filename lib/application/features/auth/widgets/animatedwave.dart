import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedWave extends StatelessWidget {
  final double height, speed, offset;

  const AnimatedWave(
      {super.key,
      required this.height,
      required this.speed,
      this.offset = 0.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: height,
          width: constraints.biggest.width,
          child: LoopAnimationBuilder(
              builder: (context, val, child) {
                return CustomPaint(
                  foregroundPainter: CurvePainter(val + offset),
                );
              },
              tween: Tween(begin: 0.0, end: 2 * pi),
              duration: Duration(milliseconds: (6000 / speed).round())),
        );
      },
    );
  }
}

class CurvePainter extends CustomPainter {
  final double value;
  CurvePainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final whiteColor = Paint()..color = Colors.white.withOpacity(0.6);
    final path = Path();

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    // path.moveTo(size.width * 0, startPointY);
    path.moveTo(0, startPointY);
    path.quadraticBezierTo(
        size.width * 0.5, controlPointY, size.width, endPointY);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, whiteColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
