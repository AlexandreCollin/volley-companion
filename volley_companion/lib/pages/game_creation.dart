import 'package:flutter/material.dart';
import 'package:volley_companion/components/player_creation.dart';
import 'package:volley_companion/components/player_card.dart';
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
  String nameTeam1 = "";
  List<Player> playersTeam1 = [
    Player(number: 4, startPosition: 0, name: "toto"),
    Player(number: 12, startPosition: 0, name: "tata"),
    Player(number: 10, startPosition: 0, name: "titi"),
    Player(number: 1, startPosition: 0, name: "tutu"),
    Player(number: 14, startPosition: 0, name: "tete"),
    Player(number: 11, startPosition: 0, name: "tyty"),
    Player(number: 8, startPosition: 0, name: "lala"),
    Player(number: 3, startPosition: 0, name: "lolo"),
    Player(number: 9, startPosition: 0, name: "lili"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Team local:"),
                  TextField(
                    onChanged: (value) => nameTeam1 = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                    ),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text("Players:"),
                      ...List.generate(
                        playersTeam1.length,
                        (index) => PlayerCard(
                          player: playersTeam1[index],
                          onDelete: () => setState(
                            () => playersTeam1.removeAt(index),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () async {
                            final Player? newPlayer =
                                await createPlayer(context);

                            if (newPlayer == null) return;
                            setState(() => playersTeam1.add(newPlayer));
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
                ],
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
