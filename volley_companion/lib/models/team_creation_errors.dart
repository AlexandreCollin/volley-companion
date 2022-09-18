import 'package:volley_companion/models/player.dart';

class TeamCreationFormError {
  static const String missingName = "Missing name";
  static const String notEnoughtPlayers = "Not enought players";

  bool isFormValid({
    required String localName,
    required List<Player> localPlayers,
    required String visitorName,
    required List<Player> visitorPlayers,
  }) {
    if (localName.isEmpty) {
      this.localName = missingName;
    } else {
      this.localName = null;
    }
    if (localPlayers.length < 6) {
      this.localPlayers = notEnoughtPlayers;
    } else {
      this.localPlayers = null;
    }
    if (visitorName.isEmpty) {
      this.visitorName = missingName;
    } else {
      this.visitorName = null;
    }
    if (visitorPlayers.length < 6) {
      this.visitorPlayers = notEnoughtPlayers;
    } else {
      this.visitorPlayers = null;
    }
    return this.localName == null &&
        this.localPlayers == null &&
        this.visitorName == null &&
        this.visitorPlayers == null;
  }

  String? localPlayers;
  String? localName;
  String? visitorPlayers;
  String? visitorName;
}
