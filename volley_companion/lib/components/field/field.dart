import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volley_companion/components/field/jersey.dart';
import 'package:volley_companion/models/player_position.dart';
import 'package:volley_companion/models/volleyball.dart';

class Field extends StatelessWidget {
  Field({super.key});

  final Map<int, PlayerPosition> positions = {
    1: PlayerPosition(top: 75, left: 50),
    2: PlayerPosition(top: 50, left: 150),
    3: PlayerPosition(top: 75, left: 250),
    4: PlayerPosition(top: 180, left: 50),
    5: PlayerPosition(top: 180, left: 150),
    6: PlayerPosition(top: 180, left: 250),
    7: PlayerPosition(top: 330, left: 50),
    8: PlayerPosition(top: 330, left: 150),
    9: PlayerPosition(top: 330, left: 250),
    10: PlayerPosition(top: 450, left: 50),
    11: PlayerPosition(top: 475, left: 150),
    12: PlayerPosition(top: 450, left: 250),
  };

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
              (index) => Positioned(
                top: positions[index + 1]!.top,
                left: positions[index + 1]!.left,
                child: Image(
                  image: const AssetImage("assets/black_jersey.png"),
                  height: constraints.maxWidth / 5,
                ),
              ),
            ),
            ...List.generate(
              (VolleyBall.nbPlayers / 2).round(),
              (index) => Positioned(
                top: positions[index + 7]!.top,
                left: positions[index + 7]!.left,
                child: Jersey(
                  number: index + 1,
                  height: constraints.maxWidth / 5,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
