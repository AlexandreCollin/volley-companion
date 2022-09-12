import 'package:flutter/material.dart';
import 'package:volley_companion/components/score_board/serv_dot.dart';
import 'package:volley_companion/models/score.dart';
import 'package:volley_companion/models/team.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    super.key,
    required this.score,
    this.service = Team.local,
    this.onTeam1Score,
    this.onTeam2Score,
    this.onTeam1UndoScore,
    this.onTeam2UndoScore,
  });

  final Score score;
  final int service;
  final void Function()? onTeam1Score;
  final void Function()? onTeam1UndoScore;
  final void Function()? onTeam2Score;
  final void Function()? onTeam2UndoScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ServDot(
                active: service == Team.local,
              ),
            ),
            ElevatedButton(
              onPressed: onTeam1Score,
              onLongPress: onTeam1UndoScore,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                score.team1.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Text("-"),
            ),
            ElevatedButton(
              onPressed: onTeam2Score,
              onLongPress: onTeam2UndoScore,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                score.team2.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ServDot(
                active: service == Team.visitor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
