import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volley_companion/models/player.dart';

Future<Player?> createPlayer(BuildContext context) async {
  String? name;
  int number = 0;

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) => name = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name (optional)",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                onChanged: (value) =>
                    value.isNotEmpty ? number = int.parse(value) : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Number",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(
                  Player(
                    startPosition: 0,
                    number: number,
                    name: name,
                  ),
                ),
                child: const Text("Create"),
              ),
            ),
          ],
        ),
      );
    },
  );
}
