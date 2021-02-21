import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games/sudoku/logic/sudoku_data.dart';
import 'package:games/sudoku/sudoku_settings.dart';

class Sudoku extends ChangeNotifier {
  final int _size = Settings.size;
  final List<int> _grid = List<int>.generate(Settings.size * Settings.size, (index) => 0);
  final List<int> _correctGrid = List<int>.generate(Settings.size * Settings.size, (index) => 0);
  final List<bool> _editableGrid =
      List<bool>.generate(Settings.size * Settings.size, (index) => false);
  int _selectedIndex;

  Sudoku() {
    reset();
  }

  bool hasWon() {
    for (int i = 0; i < _size * _size; i++) {
      if (_grid[i] != _correctGrid[i]) return false;
    }
    return true;
  }

  int getValueAt(int index) {
    return _grid[index];
  }

  bool isCorrectAt(int index) {
    return _grid[index] == _correctGrid[index];
  }

  bool isPresetAt(int index) {
    return !_editableGrid[index];
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  void playNumber(int i) {
    if (_editableGrid[_selectedIndex] == false) {
      return;
    }
    _grid[_selectedIndex] = i;
    notifyListeners();
  }

  List<int> _parseGrid(String input) {
    List<int> data = [];

    for (var c in input.characters) {
      data.add(int.parse(c));
    }

    return data;
  }

  void reset() {
    // set up new Sudoku grid for (int i = 0; i < _size * _size; i++) _grid[i] = 0;
    // set solution up in correct Grid

    List<String> lines = csv_data.split('\n');
    final index = Random().nextInt(lines.length - 1) + 1;

    final both = lines[index].split(',');

    _grid.clear();
    _correctGrid.clear();
    _grid.addAll(_parseGrid(both[0]));
    _correctGrid.addAll(_parseGrid(both[1]));

    for (int i = 0; i < _size * _size; i++) _editableGrid[i] = _grid[i] == 0;

    selectedIndex = 40;
    notifyListeners();
  }

  bool _solve(List<int> grid) {
    for (int y = 0; y < _size; y++) {
      for (int x = 0; x < _size; x++) {
        if (grid[_index(x, y)] == 0) {
          for (int possibility in _getPossibilities(grid, x, y)) {
            grid[_index(x, y)] = possibility;

            if (_solve(grid)) return true;

            grid[_index(x, y)] = 0;
          }
          return false;
        }
      }
    }
    return true;
  }

  Set<int> _getPossibilities(List<int> grid, int r, int c) {
    Set<int> possibilities = List<int>.generate(Settings.size, (index) => index + 1).toSet();

    for (int x = 0; x < Settings.size; x++) possibilities.remove(grid[_index(x, c)]);

    for (int y = 0; y < Settings.size; y++) possibilities.remove(grid[_index(r, y)]);

    int rStart = r - r % 3;
    int cStart = c - c % 3;

    for (int i = 0; i < 3; i++)
      for (int j = 0; j < 3; j++) {
        possibilities.remove(grid[_index(i + rStart, j + cStart)]);
      }

    return possibilities;
  }

  int _index(int x, int y) {
    return y * _size + x;
  }
}
