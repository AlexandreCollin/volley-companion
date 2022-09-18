import 'package:flutter/material.dart';
import 'package:volley_companion/components/score_board/serv_dot.dart';
import 'package:volley_companion/models/score.dart';
import 'package:volley_companion/models/team.dart';
import 'package:volley_companion/models/volleyball.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({
    super.key,
    this.service = Team.local,
    this.onServiceChanged,
    this.onSetEnd,
  });

  final void Function(bool)? onServiceChanged;
  final void Function(bool)? onSetEnd;
  final bool service;

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  final List<bool> servHistory = [];
  late bool service;
  final Score score = Score();

  @override
  void initState() {
    super.initState();
    servHistory.add(widget.service);
    service = widget.service;
  }

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
                if (service != Team.local) {
                  service = Team.local;
                  if (widget.onServiceChanged != null) {
                    widget.onServiceChanged!(service);
                  }
                }
                if (score.team1 < VolleyBall.maxPoints) return;
                if (score.team1 >= VolleyBall.maxPoints &&
                    score.team1 >= score.team2 + VolleyBall.ecartPoints) {
                  if (widget.onSetEnd != null) {
                    widget.onSetEnd!(Team.local);
                  }
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
                if (service != Team.visitor) {
                  service = Team.visitor;
                  if (widget.onServiceChanged != null) {
                    widget.onServiceChanged!(service);
                  }
                }
                if (score.team2 < VolleyBall.maxPoints) return;
                if (score.team2 >= VolleyBall.maxPoints &&
                    score.team2 >= score.team1 + VolleyBall.ecartPoints) {
                  // gameInfos.endSet(score.clone());
                  if (widget.onSetEnd != null) {
                    return widget.onSetEnd!(Team.visitor);
                  }
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
      ],
    );
  }
}
