import 'package:volley_companion/models/rotation.dart';
import 'package:volley_companion/models/score.dart';

class GameInfos {
  final List<Score> _setsScores = [];
  final Rotation rotationTeam1 = Rotation();
  final Rotation rotationTeam2 = Rotation();

  List<Score> get setsScores {
    return _setsScores;
  }

  void endSet(Score score) {
    _setsScores.add(score.clone());
    rotationTeam1.reset();
    rotationTeam2.reset();
  }
}
