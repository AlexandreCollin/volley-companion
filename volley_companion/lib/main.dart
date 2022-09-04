import 'package:flutter/material.dart';
import 'package:volley_companion/pages/home.dart';

void main() {
  runApp(const VolleyCompanion());
}

class VolleyCompanion extends StatelessWidget {
  const VolleyCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
