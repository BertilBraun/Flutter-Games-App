import 'package:flutter/material.dart';
import 'package:games/_logic/game_list_data.dart';
import 'package:games/_ui/game_button.dart';
import 'package:games/tetris_sudoku/tetris_sudoku_provider.dart';

class GameList extends StatelessWidget {
  static const int gamesPerRow = 3;

  final List<GameListData> games = [
    GameListData(() => TetrisSudokuProvider(), Colors.brown.shade500, Icons.add),
    GameListData(() => TetrisSudokuProvider(), Colors.brown.shade500, Icons.airline_seat_individual_suite),
    GameListData(() => TetrisSudokuProvider(), Colors.brown.shade500, Icons.do_disturb_off_rounded),
    GameListData(() => TetrisSudokuProvider(), Colors.brown.shade500, Icons.panorama_fisheye_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    while (games.length % GameList.gamesPerRow != 0) games.add(null);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(games.length ~/ 3, (row) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(GameList.gamesPerRow, (indexInRow) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GameButton(
                    data: games[row * GameList.gamesPerRow + indexInRow],
                  ),
                );
              }),
            );
          })),
    );
  }
}
