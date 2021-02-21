import 'package:flutter/material.dart';
import 'package:games/_logic/game_list_data.dart';
import 'package:games/_ui/game_button.dart';
import 'package:games/slide_2048/slide_2048_provider.dart';
import 'package:games/sliding_15/sliding_15_provider.dart';
import 'package:games/tetris_sudoku/tetris_sudoku_provider.dart';

class GameList extends StatelessWidget {
  static const int gamesPerRow = 3;

  final List<GameListData> games = [
    GameListData(() => TetrisSudokuProvider(), Colors.brown.shade500, Icons.add),
    GameListData(() => Sliding15Provider(), Colors.brown.shade500, Icons.stacked_line_chart),
    GameListData(() => Slide2048Provider(), Colors.brown.shade500, Icons.grid_view),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 16, right: 8),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: gamesPerRow,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: games.map((game) => GameButton(data: game)).toList(),
        ),
      ),
    );
  }
}
