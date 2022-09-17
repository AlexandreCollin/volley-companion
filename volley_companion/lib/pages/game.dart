import 'package:flutter/material.dart';
import 'package:volley_companion/components/field.dart';
import 'package:volley_companion/components/score_board/score_board.dart';
import 'package:volley_companion/models/game.dart';
import 'package:volley_companion/models/score.dart';
import 'package:volley_companion/models/team.dart';
import 'package:volley_companion/models/volleyball.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, this.service = Team.local});

  final bool service;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool service = Team.local;
  List<bool> servHistory = [];
  Score score = Score();
  GameInfos gameInfos = GameInfos();

  @override
  void initState() {
    super.initState();
    setState(() {
      service = widget.service;
      servHistory.add(service);
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
                    score: score,
                    service: service,
                    onTeam1Score: () => setState(() {
                      score.team1++;
                      servHistory.add(Team.local);
                      if (service != Team.local) {
                        gameInfos.rotationTeam1.rotate();
                        service = Team.local;
                      }
                      if (score.team1 < VolleyBall.maxPoints) return;
                      if (score.team1 >= VolleyBall.maxPoints &&
                          score.team1 >= score.team2 + VolleyBall.ecartPoints) {
                        gameInfos.endSet(score.clone());
                        score.reset();
                      }
                    }),
                    onTeam1UndoScore: () {
                      if (score.team1 <= 0) return;
                      setState(() {
                        score.team1--;
                        servHistory.removeLast();
                        service = servHistory.last;
                      });
                    },
                    onTeam2Score: () => setState(() {
                      score.team2++;
                      servHistory.add(Team.visitor);
                      if (service != Team.visitor) {
                        gameInfos.rotationTeam2.rotate();
                        service = Team.visitor;
                      }
                      if (score.team2 < VolleyBall.maxPoints) return;
                      if (score.team2 >= VolleyBall.maxPoints &&
                          score.team2 >= score.team1 + VolleyBall.ecartPoints) {
                        gameInfos.endSet(score.clone());
                        score.reset();
                      }
                    }),
                    onTeam2UndoScore: () {
                      if (score.team2 <= 0) return;
                      setState(() {
                        score.team2--;
                        servHistory.removeLast();
                        service = servHistory.last;
                      });
                    },
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
                      rotationTeam1: gameInfos.rotationTeam1.rotation,
                      rotationTeam2: gameInfos.rotationTeam2.rotation,
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
