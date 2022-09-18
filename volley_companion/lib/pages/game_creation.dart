import 'package:flutter/material.dart';
import 'package:volley_companion/components/team_creation_form.dart';
import 'package:volley_companion/models/team.dart';
import 'package:volley_companion/models/team_creation_errors.dart';
import 'package:volley_companion/pages/game.dart';

class GameCreationPage extends StatefulWidget {
  const GameCreationPage({super.key});
  @override
  State<GameCreationPage> createState() => _GameCreationPageState();
}

class _GameCreationPageState extends State<GameCreationPage> {
  bool service = Team.local;
  Team local = Team();
  Team visitor = Team();
  TeamCreationFormError errors = TeamCreationFormError();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TeamCreationForm(
                    side: "local",
                    team: local,
                    nameErorr: errors.localName,
                    playersError: errors.localPlayers,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TeamCreationForm(
                    side: "visitor",
                    team: visitor,
                    nameErorr: errors.visitorName,
                    playersError: errors.visitorPlayers,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!errors.isFormValid(
                          localName: local.name,
                          localPlayers: local.players,
                          visitorName: visitor.name,
                          visitorPlayers: visitor.players,
                        )) return setState(() {});
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(
                              service: service,
                              local: local,
                              visitor: visitor,
                            ),
                          ),
                        );
                      },
                      child: const Text("Start"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
