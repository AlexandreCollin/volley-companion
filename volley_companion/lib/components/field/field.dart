import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Field extends StatelessWidget {
  const Field({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SvgPicture.asset(
          "assets/field.svg",
          width: constraints.maxWidth,
        );
      },
    );
  }
}
