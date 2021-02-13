import 'package:flutter/material.dart';
import 'package:games/_logic/game_list_data.dart';
import 'package:games/_ui/game_button.dart';
import 'package:games/sliding_15/sliding_15_provider.dart';
import 'package:games/tetris_sudoku/tetris_sudoku_provider.dart';

class GameList extends StatelessWidget {
  static const int gamesPerRow = 3;

  final List<GameListData> games = [
    GameListData(() => TetrisSudokuProvider(), Colors.brown.shade500, Icons.add),
    GameListData(() => Sliding15Provider(), Colors.brown.shade500, Icons.stacked_line_chart),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: gamesPerRow,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: List.generate(games.length, (index) {
          return Center(
            child: GameButton(
              data: games[index],
            ),
          );
        }),
      ),
    );
  }
}
