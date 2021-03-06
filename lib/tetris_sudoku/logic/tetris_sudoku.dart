import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:games/tetris_sudoku/logic/grid.dart';
import 'package:games/tetris_sudoku/logic/piece.dart';
import 'package:games/tetris_sudoku/tetris_sudoku_settings.dart';

class TetrisSudoku extends ChangeNotifier {
  Grid _valueGrid;
  Grid _previewGrid;

  int score = 0;
  int scoreMultiplier = 1;
  bool scoredLastInteraction = false;

  List<Piece> nextPieces;

  TetrisSudoku() {
    nextPieces = generateNextPieces();
    _valueGrid = Grid();
    _previewGrid = Grid();
  }

  List<Piece> generateNextPieces() {
    List<Piece> elements = [];

    Random random = new Random();
    for (int i = 0; i < 3; i++) {
      elements.add(Piece.pieces[random.nextInt(Piece.pieces.length)]);
    }

    return elements;
  }

  bool set(Piece piece, int x, int y, int index) {
    nextPieces[index] = null;
    if (!nextPieces.any((element) => element != null)) nextPieces = generateNextPieces();

    score += Settings.scoreForBlockSet * scoreMultiplier;

    _valueGrid.set(piece, x, y);

    bool hasScoredLastInteraction = scoredLastInteraction;
    scoredLastInteraction = clearIfSet();

    if (hasScoredLastInteraction && scoredLastInteraction) {
      scoreMultiplier++;
      // TODO Display Streak
    } else
      scoreMultiplier = 1;

    this.notifyListeners();
    return scoredLastInteraction;
  }

  void setPreview(Piece piece, int currX, int currY) {
    _previewGrid.clearGrid();
    Point position = _valueGrid.calculateBestPosition(piece, currX, currY);
    if (position == null) return;
    _previewGrid.setValues(piece.occupations, position.x, position.y);
    clearIfSet(editValueGrid: false);

    this.notifyListeners();
  }

  bool isGameOver() {
    for (Piece piece in nextPieces) {
      if (piece != null)
        for (int y = 0; y < Settings.gridSize; y++)
          for (int x = 0; x < Settings.gridSize; x++) {
            if (_valueGrid.doesFit(piece, x, y)) return false;
          }
    }
    return true;
  }

  bool clearIfSet({bool editValueGrid = true}) {
    bool isBlockSet(int bx, int by) {
      for (int y = 0; y < Settings.blockSize; y++)
        for (int x = 0; x < Settings.blockSize; x++) {
          if (_valueGrid.isClear(bx * Settings.blockSize + x, by * Settings.blockSize + y) &&
              (editValueGrid || _previewGrid.isClear(bx * Settings.blockSize + x, by * Settings.blockSize + y))) {
            return false;
          }
        }
      return true;
    }

    bool isRowSet(int row) {
      for (int x = 0; x < Settings.gridSize; x++)
        if (_valueGrid.isClear(x, row) && (editValueGrid || _previewGrid.isClear(x, row))) {
          return false;
        }
      return true;
    }

    bool isColSet(int col) {
      for (int y = 0; y < Settings.gridSize; y++)
        if (_valueGrid.isClear(col, y) && (editValueGrid || _previewGrid.isClear(col, y))) {
          return false;
        }
      return true;
    }

    bool wasCleared = false;
    Grid newValueGrid = Grid.copy(_valueGrid);

    for (int by = 0; by < Settings.blockCount; by++)
      for (int bx = 0; bx < Settings.blockCount; bx++) {
        if (isBlockSet(bx, by)) {
          wasCleared = true;
          _previewGrid.setValues([
            [true, true, true],
            [true, true, true],
            [true, true, true]
          ], bx * Settings.blockSize, by * Settings.blockSize, GridState.COMPLETED);

          if (editValueGrid) {
            score += Settings.scoreForBlockCleared * scoreMultiplier;
            for (int y = 0; y < Settings.blockSize; y++)
              for (int x = 0; x < Settings.blockSize; x++) {
                newValueGrid.setValue(bx * Settings.blockSize + x, by * Settings.blockSize + y, GridState.CLEAR);
                // TODO here would an animation start to show
              }
          }
        }
      }

    for (int row = 0; row < Settings.gridSize; row++)
      if (isRowSet(row)) {
        wasCleared = true;
        _previewGrid.setValues([
          [true, true, true, true, true, true, true, true, true]
        ], 0, row, GridState.COMPLETED);
        if (editValueGrid) {
          score += Settings.scoreForBlockCleared * scoreMultiplier;
          for (int x = 0; x < Settings.gridSize; x++) {
            newValueGrid.setValue(x, row, GridState.CLEAR);
            // TODO here would an animation start to show
          }
        }
      }

    for (int col = 0; col < Settings.gridSize; col++)
      if (isColSet(col)) {
        wasCleared = true;
        _previewGrid.setValues([
          [true],
          [true],
          [true],
          [true],
          [true],
          [true],
          [true],
          [true],
          [true]
        ], col, 0, GridState.COMPLETED);
        if (editValueGrid) {
          score += Settings.scoreForBlockCleared * scoreMultiplier;
          for (int y = 0; y < Settings.gridSize; y++) {
            newValueGrid.setValue(col, y, GridState.CLEAR);
            // TODO here would an animation start to show
          }
        }
      }

    _valueGrid = newValueGrid;

    if (wasCleared && editValueGrid) {
      Timer(
        Duration(seconds: 1),
        clearPreview,
      );
    }
    return wasCleared;
  }

  void clearPreview() {
    _previewGrid.clearGrid();
    this.notifyListeners();
  }

  bool canPlaceFrom(Piece piece, int currX, int currY) {
    return _valueGrid.calculateBestPosition(piece, currX, currY) != null;
  }

  void reset() {
    score = 0;
    scoreMultiplier = 1;
    scoredLastInteraction = false;

    nextPieces = generateNextPieces();
    _valueGrid = Grid();
    _previewGrid = Grid();
  }

  bool isCompleted(int x, int y) {
    return _previewGrid.isCompleted(x, y);
  }

  bool isSet(int x, int y) {
    return _valueGrid.isSet(x, y);
  }

  bool isPreview(int x, int y) {
    return _previewGrid.isSet(x, y);
  }
}
