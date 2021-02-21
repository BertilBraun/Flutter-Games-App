
import 'package:flutter/material.dart';
import 'package:games/sudoku/ui/game_grid.dart';
import 'package:games/sudoku/ui/number_button_list.dart';

class SudokuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // StatusBar(),
          GameGrid(),
          SizedBox(height: 16),
          NumberButtonList(),
        ],
      ),
    );
  }
}
