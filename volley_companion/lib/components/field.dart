import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volley_companion/components/jersey/jersey.dart';
import 'package:volley_companion/models/player_position.dart';
import 'package:volley_companion/models/team.dart';
import 'package:volley_companion/models/volleyball.dart';

class Field extends StatelessWidget {
  Field({
    super.key,
    required this.local,
    required this.visitor,
  });

  final Map<int, PlayerPosition> positionsTeam1 = {
    1: PlayerPosition(top: 5, left: 7.5),
    2: PlayerPosition(top: 2, left: 7.5),
    3: PlayerPosition(top: 2, left: 2.5),
    4: PlayerPosition(top: 2, left: 1.5),
    5: PlayerPosition(top: 5, left: 1.5),
    6: PlayerPosition(top: 7.5, left: 2.5),
  };

  final Map<int, PlayerPosition> positionsTeam2 = {
    1: PlayerPosition(top: 0.83, left: 1.5),
    2: PlayerPosition(top: 1.136, left: 1.5),
    3: PlayerPosition(top: 1.136, left: 2.5),
    4: PlayerPosition(top: 1.136, left: 7.5),
    5: PlayerPosition(top: 0.83, left: 7.5),
    6: PlayerPosition(top: 0.789, left: 2.5),
  };

  final Team local;
  final Team visitor;

  int getRotation(int position, int rotation) {
    if (position + rotation > 6) {
      return position + rotation - 6;
    } else {
      return position + rotation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            SvgPicture.asset(
              "assets/field.svg",
              width: constraints.maxWidth,
            ),
            ...List.generate(
              (VolleyBall.nbPlayers / 2).round(),
              (index) => AnimatedPositioned(
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
                top: constraints.maxWidth /
                    positionsTeam1[
                            getRotation(index + 1, local.rotation.value)]!
                        .top,
                left: constraints.maxWidth /
                    positionsTeam1[
                            getRotation(index + 1, local.rotation.value)]!
                        .left,
                child: Jersey(
                  color: Colors.black,
                  number: local.players[index].number,
                  width: constraints.maxWidth / 5,
                ),
              ),
            ),
            ...List.generate(
              (VolleyBall.nbPlayers / 2).round(),
              (index) => AnimatedPositioned(
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
                top: constraints.maxWidth /
                    positionsTeam2[
                            getRotation(index + 1, visitor.rotation.value)]!
                        .top,
                left: constraints.maxWidth /
                    positionsTeam2[
                            getRotation(index + 1, visitor.rotation.value)]!
                        .left,
                child: Jersey(
                  color: Colors.red,
                  number: visitor.players[index].number,
                  width: constraints.maxWidth / 5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
