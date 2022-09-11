import 'package:flutter/material.dart';

class Jersey extends StatelessWidget {
  const Jersey({super.key, this.number, this.height, this.color = "white"});

  final int? number;
  final double? height;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage("assets/${color}_jersey.png"),
          height: height,
        ),
        Positioned(
          top: height != null ? (height! / 5) : null,
          left: height != null ? (height! / 3) : null,
          child: Text(
            number.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: height != null ? (height! / 2) : null,
            ),
          ),
        ),
      ],
    );
  }
}
