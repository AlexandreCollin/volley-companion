class Rotation {
  int _rotation = 6;

  int get rotation {
    return _rotation;
  }

  void rotate() {
    if (_rotation == 1) {
      _rotation = 6;
    } else {
      _rotation--;
    }
  }

  void reset() {
    _rotation = 6;
  }
}
