import 'package:flutter/material.dart';

class Jersey extends StatelessWidget {
  const Jersey({super.key, this.number, this.height});

  final int? number;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: const AssetImage("assets/red_jersey.png"),
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
