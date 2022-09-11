import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:volley_companion/components/field/jersey.dart';
import 'package:volley_companion/models/player_position.dart';
import 'package:volley_companion/models/volleyball.dart';

class Field extends StatefulWidget {
  const Field({super.key});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  Map<int, PlayerPosition> positionsTeam1 = {
    1: PlayerPosition(top: 5, left: 7.5),
    2: PlayerPosition(top: 2, left: 7.5),
    3: PlayerPosition(top: 2, left: 2.5),
    4: PlayerPosition(top: 2, left: 1.5),
    5: PlayerPosition(top: 5, left: 1.5),
    6: PlayerPosition(top: 7.5, left: 2.5),
  };

  Map<int, PlayerPosition> positionsTeam2 = {
    1: PlayerPosition(top: 0.83, left: 1.5),
    2: PlayerPosition(top: 1.136, left: 1.5),
    3: PlayerPosition(top: 1.136, left: 2.5),
    4: PlayerPosition(top: 1.136, left: 7.5),
    5: PlayerPosition(top: 0.83, left: 7.5),
    6: PlayerPosition(top: 0.789, left: 2.5),
  };

  int rotation = 6;

  int getRotation(int position) {
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
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () => setState(() {
                print(constraints.maxWidth);
                if (rotation == 1) {
                  rotation = 6;
                } else {
                  rotation--;
                }
              }),
              child: const Text(
                "move",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ...List.generate(
              (VolleyBall.nbPlayers / 2).round(),
              (index) => AnimatedPositioned(
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
                top: constraints.maxWidth /
                    positionsTeam1[getRotation(index)]!.top,
                left: constraints.maxWidth /
                    positionsTeam1[getRotation(index)]!.left,
                child: Jersey(
                  color: "black",
                  number: index + 1,
                  height: constraints.maxWidth / 5,
                ),
              ),
            ),
            ...List.generate(
              (VolleyBall.nbPlayers / 2).round(),
              (index) => AnimatedPositioned(
                curve: Curves.ease,
                duration: const Duration(seconds: 1),
                top: constraints.maxWidth /
                    positionsTeam2[getRotation(index)]!.top,
                left: constraints.maxWidth /
                    positionsTeam2[getRotation(index)]!.left,
                child: Jersey(
                  color: "red",
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
