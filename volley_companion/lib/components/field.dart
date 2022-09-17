import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volley_companion/components/jersey/jersey.dart';
import 'package:volley_companion/models/player_position.dart';
import 'package:volley_companion/models/volleyball.dart';

class Field extends StatelessWidget {
  Field({super.key, this.rotationTeam1 = 6, this.rotationTeam2 = 6});

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

  final int rotationTeam1;
  final int rotationTeam2;

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
                    positionsTeam1[getRotation(index + 1, rotationTeam1)]!.top,
                left: constraints.maxWidth /
                    positionsTeam1[getRotation(index + 1, rotationTeam1)]!.left,
                child: Jersey(
                  color: Colors.black,
                  number: index + 1,
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
                    positionsTeam2[getRotation(index + 1, rotationTeam2)]!.top,
                left: constraints.maxWidth /
                    positionsTeam2[getRotation(index + 1, rotationTeam2)]!.left,
                child: Jersey(
                  color: Colors.red,
                  number: index + 1,
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
