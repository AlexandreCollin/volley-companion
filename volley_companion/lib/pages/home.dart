import 'package:flutter/material.dart';
import 'package:volley_companion/components/field/field.dart';
import 'package:volley_companion/components/score_board/score_board.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const ScoreBoard(),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Field(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
