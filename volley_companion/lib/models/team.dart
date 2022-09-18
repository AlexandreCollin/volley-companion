import 'package:flutter/material.dart';
import 'package:volley_companion/models/player.dart';

class Team {
  static const bool local = true;
  static const bool visitor = false;

  String name;
  List<Player> players;
  Color color;

  Team({
    this.name = "unknow",
    this.players = const [],
    this.color = Colors.white,
  });
}
