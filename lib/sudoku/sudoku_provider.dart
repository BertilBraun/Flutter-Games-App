import 'package:flutter/material.dart';
import 'package:games/_widgets/game_provider.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:games/sudoku/ui/restart_button.dart';
import 'package:games/sudoku/ui/sudoku_page.dart';

class SudokuProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameProvider<Sudoku>(
      title: "Sudoku",
      pageBuilder: (_) => SudokuPage(),
      gameProvider: (_) => Sudoku(),
      actionButtons: [
        RestartButton(),
      ],
    );
  }
}
