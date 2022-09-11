import 'package:flutter/material.dart';
import 'package:volley_companion/components/field/field.dart';
import 'package:volley_companion/components/score_board/score_board.dart';
import 'package:volley_companion/models/team.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int service = Team.local;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  ScoreBoard(),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
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
