import 'package:flutter/material.dart';
import 'package:volley_companion/components/field.dart';
import 'package:volley_companion/components/score_board/score_board.dart';
import 'package:volley_companion/models/game.dart';
import 'package:volley_companion/models/team.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
    this.service = Team.local,
    required this.local,
    required this.visitor,
  });

  final bool service;
  final Team local;
  final Team visitor;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool service = Team.local;
  List<bool> servHistory = [];
  GameInfos gameInfos = GameInfos();

  @override
  void initState() {
    super.initState();
    setState(() {
      service = widget.service;
      servHistory.add(service);
      gameInfos.local = widget.local;
      gameInfos.visitor = widget.visitor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ScoreBoard(
                    service: service,
                    onServiceChanged: (team) => setState(() {
                      if (team == Team.local) {
                        gameInfos.local.rotation.rotate();
                      } else {
                        gameInfos.visitor.rotation.rotate();
                      }
                    }),
                    onSetEnd: (value) => setState(
                      () => gameInfos.endSet(value),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        gameInfos.setsScores.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            "${gameInfos.setsScores[index].team1}-${gameInfos.setsScores[index].team2}",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Field(
                      local: widget.local,
                      visitor: widget.visitor,
                    ),
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
