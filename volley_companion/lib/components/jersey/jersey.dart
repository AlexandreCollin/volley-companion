import 'package:flutter/material.dart';
import 'package:volley_companion/components/jersey/jersey_painter.dart';

class Jersey extends StatelessWidget {
  const Jersey({
    super.key,
    this.number,
    this.name,
    this.width = 50,
    this.color = Colors.white,
  });

  final String? name;
  final int? number;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CustomPaint(
          size: Size(width, width),
          painter: JerseyPainter(color: color),
        ),
        Text(
          number.toString(),
          style: TextStyle(
            color: color != Colors.black ? Colors.black : Colors.white,
            fontSize: width / 3,
          ),
        ),
      ],
    );
  }
}
