import 'package:volley_companion/models/rotation.dart';
import 'package:volley_companion/models/score.dart';

class GameInfos {
  final List<Score> _setsScores = [];
  final Rotation rotationLocal = Rotation();
  final Rotation rotationVisitor = Rotation();

  List<Score> get setsScores {
    return _setsScores;
  }

  void endSet(Score score) {
    _setsScores.add(score.clone());
    rotationLocal.reset();
    rotationVisitor.reset();
  }
}
