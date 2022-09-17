import 'package:flutter/material.dart';
import 'package:volley_companion/models/player.dart';

class Team {
  static const bool local = true;
  static const bool visitor = false;

  final String name;
  final List<Player> players;
  final Color color;

  Team({
    required this.name,
    this.players = const [],
    this.color = Colors.white,
  });
}
