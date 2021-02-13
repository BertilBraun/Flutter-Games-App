import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:games/sliding_15/sliding_15_settings.dart';

class Sliding15 extends ChangeNotifier {
  final int _size;
  final List<int> _grid;

  Sliding15(this._size) : _grid = List<int>.generate(_size * _size, (index) => index) {
    _grid.last = null;
    shuffle();
  }

  bool isGameOver() {
    for (int i = 0; i < _size * _size - 2; i++) {
      if (_grid[i] == null || _grid[i + 1] == null || _grid[i] > _grid[i + 1]) {
        return false;
      }
    }
    return true;
  }

  void shuffle() {
    var random = new Random();

    for (var repeat = 0; repeat < Settings.shuffleCount; repeat++){
      // Go through all elements.
      for (var i = _grid.length - 1; i > 0; i--) {
        // Pick a pseudorandom number according to the list length
        var n = random.nextInt(i + 1);

        var temp = _grid[i];
        _grid[i] = _grid[n];
        _grid[n] = temp;
      }
    }
    this.notifyListeners();
  }

  bool moveFromTo(int fromIdx, int toIdx) {
    if (fromIdx == toIdx) return false;

    Point from = Point(fromIdx % _size, fromIdx ~/ _size);
    Point to = Point(toIdx % _size, toIdx ~/ _size);

    Point res = from - to;

    int toIndex;
    if (res.x.abs() > res.y.abs()) {
      // we moved in x direction
      if (res.x.isNegative)
        toIndex = fromIdx + 1;
      else
        toIndex = fromIdx - 1;
    } else {
      // we moved in y direction
      if (res.y.isNegative)
        toIndex = fromIdx + _size;
      else
        toIndex = fromIdx - _size;
    }

    if (!_inGrid(toIndex) || _grid[toIndex] != null) return false;

    _grid[toIndex] = _grid[fromIdx];
    _grid[fromIdx] = null;
    this.notifyListeners();
    return true;
  }

  bool _inGrid(int index) {
    return index >= 0 && index < _size * _size;
  }

  int getValueAt(int index) {
    return _grid[index];
  }
}
