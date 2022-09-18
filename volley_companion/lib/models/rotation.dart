class Rotation {
  int _value = 6;

  int get value {
    return _value;
  }

  void rotate() {
    if (_value == 1) {
      _value = 6;
    } else {
      _value--;
    }
  }

  void reset() {
    _value = 6;
  }
}
