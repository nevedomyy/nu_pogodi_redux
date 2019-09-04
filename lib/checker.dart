import 'package:flutter/material.dart';


class Checker extends CustomPainter{
  final bool _red;

  Checker(this._red);

  @override
  void paint(Canvas canvas, Size size) {
    double s = size.width/2;
    final paint = Paint()
      ..color = Colors.white12
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(s, s), s, Paint()..color = _red ? Colors.red[800] : Color(0xFF1E1E1E));
    canvas.drawCircle(Offset(s, s), s*0.6, paint);
    canvas.drawCircle(Offset(s, s), s*0.8, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}