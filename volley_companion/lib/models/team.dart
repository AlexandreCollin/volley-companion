import 'package:flutter/material.dart';
import 'package:volley_companion/models/player.dart';
import 'package:volley_companion/models/rotation.dart';

class Team {
  static const bool local = true;
  static const bool visitor = false;

  String name;
  final List<Player> players = [];
  Color color;
  final Rotation rotation = Rotation();

  Team({
    this.name = "",
    this.color = Colors.white,
  });
}
