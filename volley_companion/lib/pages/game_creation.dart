import 'package:flutter/material.dart';
import 'package:volley_companion/components/team_creation_form.dart';
import 'package:volley_companion/models/player.dart';
import 'package:volley_companion/models/team.dart';
import 'package:volley_companion/pages/game.dart';

class GameCreationPage extends StatefulWidget {
  const GameCreationPage({super.key});
  @override
  State<GameCreationPage> createState() => _GameCreationPageState();
}

class _GameCreationPageState extends State<GameCreationPage> {
  bool service = Team.local;
  Team local = Team(
    players: [
      Player(number: 4, startPosition: 0, name: "toto"),
      Player(number: 12, startPosition: 0, name: "tata"),
      Player(number: 10, startPosition: 0, name: "titi"),
      Player(number: 1, startPosition: 0, name: "tutu"),
      Player(number: 14, startPosition: 0, name: "tete"),
      Player(number: 11, startPosition: 0, name: "tyty"),
      Player(number: 8, startPosition: 0, name: "lala"),
      Player(number: 3, startPosition: 0, name: "lolo"),
      Player(number: 9, startPosition: 0, name: "lili"),
    ],
  );
  Team visitor = Team(
    players: [
      Player(number: 4, startPosition: 0, name: "toto"),
      Player(number: 12, startPosition: 0, name: "tata"),
      Player(number: 10, startPosition: 0, name: "titi"),
      Player(number: 1, startPosition: 0, name: "tutu"),
      Player(number: 14, startPosition: 0, name: "tete"),
      Player(number: 11, startPosition: 0, name: "tyty"),
      Player(number: 8, startPosition: 0, name: "lala"),
      Player(number: 3, startPosition: 0, name: "lolo"),
      Player(number: 9, startPosition: 0, name: "lili"),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Column(
                children: [
                  const Text("Service: "),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Local"),
                            Checkbox(
                              value: service,
                              onChanged: (value) =>
                                  setState(() => service = value!),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              value: !service,
                              onChanged: (value) =>
                                  setState(() => service = !value!),
                            ),
                            const Text("Visitor"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TeamCreationForm(
                side: "local",
                team: local,
              ),
              TeamCreationForm(
                side: "visitor",
                team: visitor,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GamePage(
                          service: service,
                          local: local,
                          visitor: visitor,
                        ),
                      ),
                    ),
                    child: const Text("Start"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
