import 'dart:math';

import 'package:flutter/cupertino.dart';

class Slide2048 extends ChangeNotifier {
  final int _size;
  final List<int> _grid;
  final List<bool> _merged;

  bool hasMoved = false;
  int score = 0;

  Slide2048(this._size)
      : _grid = List<int>.generate(_size * _size, (index) => 0),
        _merged = List<bool>.generate(_size * _size, (index) => false) {
    for (int i = 0; i < 4; i++) _addNewBlock();
  }

  bool isGameOver() {
    for (int i = 0; i < _size * _size; i++) {
      if (_grid[i] == 0) return false;
      if (_inGrid(i + 1) && _grid[i] == _grid[i + 1] && i % 4 < (i + 1) % 4) return false;
      if (_inGrid(i + _size) && _grid[i] == _grid[i + _size]) return false;
    }
    return true;
  }

  bool hasWon() {
    for (int i = 0; i < _size * _size; i++) {
      if (_grid[i] == 2048) return true;
    }
    return false;
  }

  void _merge(int from, int to) {
    if (_merged[to] == true || _grid[from] == 0) return;

    if (_grid[to] == 0) {
      _grid[to] = _grid[from];
      _grid[from] = 0;
      hasMoved = true;
    } else {
      if (_grid[from] == _grid[to]) {
        _grid[to] *= 2;
        _grid[from] = 0;
        score += _grid[to];
        hasMoved = true;
      }
      _merged[to] = true;
    }
  }

  void _moveLeft() {
    for (int y = 0; y < _size; y++) {
      for (int x = 0; x < _size; x++) {
        int c = x;
        while (c > 0) {
          _merge(_index(y, c), _index(y, c - 1));
          c--;
        }
      }
    }
  }

  void _moveRight() {
    for (int y = 0; y < _size; y++) {
      for (int x = _size - 2; x >= 0; x--) {
        int c = x;
        while (c < _size - 1) {
          _merge(_index(y, c), _index(y, c + 1));
          c++;
        }
      }
    }
  }

  void _moveDown() {
    for (int y = _size - 2; y >= 0; y--) {
      for (int x = 0; x < _size; x++) {
        int c = y;
        while (c < _size - 1) {
          _merge(_index(c, x), _index(c + 1, x));
          c++;
        }
      }
    }
  }

  void _moveUp() {
    for (int y = 0; y < _size; y++) {
      for (int x = 0; x < _size; x++) {
        int c = y;
        while (c > 0) {
          _merge(_index(c, x), _index(c - 1, x));
          c--;
        }
      }
    }
  }

  void move(Point direction) {
    hasMoved = false;
    for (int i = 0; i < _size * _size; i++) _merged[i] = false;

    if (direction.x.abs() > direction.y.abs()) {
      if (direction.x.isNegative) {
        _moveLeft();
      } else {
        _moveRight();
      }
    } else {
      if (direction.y.isNegative) {
        _moveDown();
      } else {
        _moveUp();
      }
    }

    if (hasMoved) _addNewBlock();
    notifyListeners();
  }

  void _addNewBlock() {
    List<int> options = [];
    for (int i = 0; i < _size * _size; i++) {
      if (_grid[i] == 0) options.add(i);
    }

    if (options.isEmpty) return;

    Random rand = Random();
    int idx = options[rand.nextInt(options.length)];
    _grid[idx] = rand.nextInt(3) + 1;
    if (_grid[idx] == 3) _grid[idx] = 4;
  }

  int _index(int y, int x) {
    return y * _size + x;
  }

  bool _inGrid(int index) {
    return index >= 0 && index < _size * _size;
  }

  int getValueAt(int index) {
    return _grid[index];
  }

  void reset() {
    for (int i = 0; i < _size * _size; i++) _grid[i] = 0;
    score = 0;

    for (int i = 0; i < 4; i++) _addNewBlock();
    notifyListeners();
  }
}
