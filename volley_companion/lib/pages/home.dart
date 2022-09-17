import 'package:flutter/material.dart';
import 'package:volley_companion/pages/game_creation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const GameCreationPage(),
            ),
          ),
          child: const Text("New game"),
        ),
      ),
    );
  }
}
