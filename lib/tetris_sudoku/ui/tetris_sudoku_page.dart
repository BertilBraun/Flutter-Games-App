import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:games/tetris_sudoku/ui/block_grid.dart';
import 'package:games/tetris_sudoku/ui/next_item_list.dart';
import 'package:games/tetris_sudoku/ui/status_bar.dart';

class TetrisSudokuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StatusBar(),
          BlockGrid(),
          NextItemList(),
        ],
      ),
    );
  }
}
