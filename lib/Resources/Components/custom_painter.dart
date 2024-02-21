

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color backgroundColor;

  RPSCustomPainter({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3244320, size.height * 0.2227273);
    path_0.cubicTo(
        size.width * 0.1781040,
        size.height * 0.2336364,
        size.width * 0.04717413,
        size.height * 0.1030300,
        0,
        size.height * 0.03636364);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.03636364);
    path_0.cubicTo(
        size.width * 0.9279040,
        size.height * 0.2136364,
        size.width * 0.7383173,
        size.height * 0.2181818,
        size.width * 0.6809067,
        size.height * 0.2181818);
    path_0.cubicTo(
        size.width * 0.6234987,
        size.height * 0.2181818,
        size.width * 0.6128160,
        size.height * 0.2454545,
        size.width * 0.6128160,
        size.height * 0.3227273);
    path_0.cubicTo(
        size.width * 0.6128160,
        size.height * 0.5000000,
        size.width * 0.6250267,
        size.height * 0.7107127,
        size.width * 0.5540720,
        size.height * 0.7409091);
    path_0.cubicTo(
        size.width * 0.4452213,
        size.height * 0.7190000,
        size.width * 0.3881067,
        size.height * 0.8409091,
        size.width * 0.3858480,
        size.height * 0.4409091);
    path_0.cubicTo(
        size.width * 0.3831787,
        size.height * 0.3227273,
        size.width * 0.3898533,
        size.height * 0.2227273,
        size.width * 0.3244320,
        size.height * 0.2227273);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = backgroundColor.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
