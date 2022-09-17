import 'package:flutter/material.dart';
import 'package:volley_companion/pages/home.dart';

void main() {
  runApp(const VolleyballCompanion());
}

class VolleyballCompanion extends StatelessWidget {
  const VolleyballCompanion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
