import 'package:flutter/material.dart';
import 'package:games/_widgets/game_dialog.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:games/sudoku/sudoku_settings.dart';
import 'package:games/sudoku/ui/game_block.dart';
import 'package:provider/provider.dart';

class GameGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemSize = (MediaQuery.of(context).size.width * 0.95) / Settings.size;

    Sudoku game = context.read<Sudoku>();
    if (game.hasWon()) {
      showGameWonDialog(context, -1, game.reset);
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            Settings.blockCount,
            (by) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  Settings.blockCount,
                  (bx) {
                    return DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          Settings.blockSize,
                          (y) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                Settings.blockSize,
                                (x) {
                                  int currX = bx * Settings.blockSize + x;
                                  int currY = by * Settings.blockSize + y;
                                  int index = currY * Settings.size + currX;
                                  return Block(
                                    itemSize: itemSize,
                                    index: index,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GridView.count(
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
        ],
      ),
    );
  }
}
