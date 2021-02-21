import 'dart:math';

import 'package:flutter/material.dart';
import 'package:games/_widgets/game_dialog.dart';
import 'package:games/_widgets/swipe_detector.dart';
import 'package:games/slide_2048/logic/slide_2048.dart';
import 'package:games/slide_2048/slide_2048_settings.dart';
import 'package:games/slide_2048/ui/game_block.dart';
import 'package:provider/provider.dart';

class GameGrid extends StatelessWidget {

  void play(BuildContext context, Point offset) async {
    var game = context.read<Slide2048>();
    game.move(offset);

    if (game.hasWon()) {
      await showGameWonDialog(context, game.score, game.reset);
    } else if (game.isGameOver()) {
      await showGameOverDialog(context, game.score, game.reset);
    }
  }

  @override
  Widget build(BuildContext context) {
    var itemSize = (MediaQuery.of(context).size.width * 0.95) / Settings.size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          SwipeDetector(
            onSwipeUp: () => play(context, Point(0, 1)),
            onSwipeDown: () => play(context, Point(0, -1)),
            onSwipeLeft: () => play(context, Point(-1, 0)),
            onSwipeRight: () => play(context, Point(1, 0)),
            child: GridView.count(
              crossAxisCount: Settings.size,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              shrinkWrap: true,
              children: List.generate(
                Settings.size * Settings.size,
                    (index) {
                  return Block(
                    itemSize: itemSize,
                    index: index,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
