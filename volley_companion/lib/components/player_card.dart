import 'package:flutter/material.dart';
import 'package:volley_companion/models/player.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.player,
    this.color = Colors.white,
    this.onDelete,
  });

  final Player player;
  final Color color;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: SizedBox(
                width: 20,
                height: 20,
                child: ElevatedButton(
                  onPressed: onDelete,
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(0),
                      backgroundColor: Colors.transparent),
                  child: const Icon(
                    Icons.cancel,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
