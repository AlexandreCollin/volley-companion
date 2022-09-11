import 'package:flutter/material.dart';
import 'package:volley_companion/components/score_board/serv_dot.dart';
import 'package:volley_companion/models/game_score.dart';
import 'package:volley_companion/models/score.dart';
import 'package:volley_companion/models/team.dart';
import 'package:volley_companion/models/volleyball.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({super.key, this.onServChange});

  final void Function()? onServChange;

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int service = Team.local;
  List<int> servHistory = [Team.local];
  Score score = Score();
  GameScore gameScore = GameScore();

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
              onPressed: () => setState(() {
                score.team1++;
                servHistory.add(Team.local);
                service = Team.local;
                if (score.team1 < VolleyBall.maxPoints) return;
                if (score.team1 >= VolleyBall.maxPoints &&
                    score.team1 >= score.team2 + VolleyBall.ecartPoints) {
                  gameScore.setsScores.add(score.clone());
                  score.reset();
                }
              }),
              onLongPress: () {
                if (score.team1 <= 0) return;
                setState(() {
                  score.team1--;
                  servHistory.removeLast();
                  service = servHistory.last;
                });
              },
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
              onPressed: () => setState(() {
                score.team2++;
                servHistory.add(Team.visitor);
                service = Team.visitor;
                if (score.team2 < VolleyBall.maxPoints) return;
                if (score.team2 >= VolleyBall.maxPoints &&
                    score.team2 >= score.team1 + VolleyBall.ecartPoints) {
                  gameScore.setsScores.add(score.clone());
                  score.reset();
                }
              }),
              onLongPress: () {
                if (score.team2 <= 0) return;
                setState(() {
                  score.team2--;
                  servHistory.removeLast();
                  service = servHistory.last;
                });
              },
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
        SizedBox(
          height: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              gameScore.setsScores.length,
              (index) => Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                    "${gameScore.setsScores[index].team1}-${gameScore.setsScores[index].team2}"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
