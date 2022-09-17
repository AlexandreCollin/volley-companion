import 'package:flutter/material.dart';

class JerseyPainter extends CustomPainter {
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 0;

    final Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  JerseyPainter({this.color = Colors.black});
}
