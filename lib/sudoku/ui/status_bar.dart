import 'package:flutter/material.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:provider/provider.dart';

class StatusBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Consumer<Sudoku>(
          //   builder: (context, game, child) => Text(
          //     'Score: ${game.score}',
          //     style: const TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
