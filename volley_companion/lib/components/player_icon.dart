import 'package:flutter/material.dart';
import 'package:volley_companion/models/player.dart';

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({
    super.key,
    required this.player,
    this.color = Colors.white,
  });

  final Player player;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 5),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (player.name != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(player.name!),
                ),
              Text(player.number.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
