import 'package:flutter/material.dart';

class ServDot extends StatelessWidget {
  const ServDot({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ColoredBox(
        color: active ? Colors.white : Colors.transparent,
        child: const SizedBox(
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
