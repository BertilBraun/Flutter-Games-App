
import 'package:flutter/material.dart';
import 'package:games/_widgets/game_provider.dart';
import 'package:games/tetris_sudoku/logic/tetris_sudoku.dart';
import 'package:games/tetris_sudoku/ui/tetris_sudoku_page.dart';

class TetrisSudokuProvider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GameProvider<TetrisSudoku>(
      title: "Tetris Sudoku",
      pageBuilder: (_) => TetrisSudokuPage(),
      gameProvider: (_) => TetrisSudoku(),
    );
  }
}