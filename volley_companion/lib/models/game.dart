import 'package:volley_companion/models/score.dart';
import 'package:volley_companion/models/team.dart';

class GameInfos {
  final List<Score> _setsScores = [];
  Team local = Team();
  Team visitor = Team();

  List<Score> get setsScores {
    return _setsScores;
  }

  void endSet(Score score) {
    _setsScores.add(score.clone());
    local.rotation.reset();
    visitor.rotation.reset();
  }
}
