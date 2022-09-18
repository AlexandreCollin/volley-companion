import 'dart:developer';

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
    this.nameErorr,
    this.playersError,
  });

  final String side;
  final Team team;
  final String? nameErorr;
  final String? playersError;
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
            Text("Team ${widget.side}:"),
            if (widget.nameErorr != null)
              Text(
                widget.nameErorr!,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
              onChanged: (value) {
                log("changed $value");
                widget.team.name = value;
              },
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Text("Players:"),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
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
        if (widget.playersError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.playersError!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
