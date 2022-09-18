import 'package:flutter/material.dart';
import 'package:volley_companion/components/player_card.dart';
import 'package:volley_companion/components/player_creation.dart';
import 'package:volley_companion/models/player.dart';
import 'package:volley_companion/models/team.dart';

class TeamCreationForm extends StatefulWidget {
  const TeamCreationForm({
    super.key,
    this.side = "",
    required this.team,
  });

  final String side;
  final Team team;

  @override
  State<TeamCreationForm> createState() => _TeamCreationFormState();
}

class _TeamCreationFormState extends State<TeamCreationForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Team ${widget.side}:"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
                onChanged: (value) => widget.team.name = value,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, top: 5, bottom: 5),
            child: Row(
              children: const [
                Text("Players:"),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...List.generate(
                widget.team.players.length,
                (index) => PlayerCard(
                  player: widget.team.players[index],
                  onDelete: () => setState(
                    () => widget.team.players.removeAt(index),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
                height: 20,
                child: ElevatedButton(
                  onPressed: () async {
                    final Player? newPlayer = await createPlayer(context);

                    if (newPlayer == null) return;
                    setState(() => widget.team.players.add(newPlayer));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
