
import 'package:flutter/material.dart';
import 'package:games/tetris_sudoku/logic/tetris_sudoku.dart';
import 'package:provider/provider.dart';

class Block extends StatelessWidget {
  const Block({
    Key key,
    @required this.itemSize,
    @required this.currX,
    @required this.currY,
  }) : super(key: key);

  final double itemSize;
  final int currX;
  final int currY;

  @override
  Widget build(BuildContext context) {
    return Consumer<TetrisSudoku>(
      builder: (context, game, child) {
        return SizedBox(
          width: itemSize,
          height: itemSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 0.1,
              ),
              color: game.isCompleted(currX, currY)
                  ? Colors.amber.shade500
                  : game.isSet(currX, currY)
                  ? Colors.brown.shade600
                  : (game.isPreview(currX, currY)
                  ? Colors.brown.shade400
                  : Colors.brown.shade300),
            ),
          ),
        );
      }
    );
  }
}
