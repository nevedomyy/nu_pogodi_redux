import 'package:flutter/material.dart';


class BlueSquare extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    double s = size.width;
    var path = Path();
    path.moveTo(0.0, s/2);
    path.lineTo(s/4, 0.0);
    path.lineTo(s*3/4, 0.0);
    path.lineTo(s, s/2);
    path.lineTo(s*3/4, s);
    path.lineTo(s/4, s);
    path.lineTo(0.0, s/2);
    path.close();
    canvas.drawPath(path, Paint()..color = Color(0xFFefdecd));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}