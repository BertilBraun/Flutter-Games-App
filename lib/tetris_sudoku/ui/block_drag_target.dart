
import 'package:flutter/material.dart';
import 'package:games/tetris_sudoku/logic/drag_data.dart';
import 'package:games/tetris_sudoku/logic/tetris_sudoku.dart';
import 'package:games/tetris_sudoku/ui/block.dart';
import 'package:games/_widgets/game_dialog.dart';
import 'package:provider/provider.dart';

class BlockDragTarget extends StatelessWidget {
  const BlockDragTarget({
    Key key,
    @required this.currX,
    @required this.currY,
    @required this.itemSize,
  }) : super(key: key);

  final int currX;
  final int currY;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return DragTarget<DragData>(
      onWillAccept: (data) {
        var game = context.read<TetrisSudoku>();
        game.setPreview(data.piece, currX, currY);
        return game.canPlaceFrom(data.piece, currX, currY);
      },
      onLeave: (data) {
        context.read<TetrisSudoku>().clearPreview();
      },
      onAccept: (data) async {
        var game = context.read<TetrisSudoku>();
        game.clearPreview();
        game.set(data.piece, currX, currY, data.index);
        if (game.isGameOver()) {
          await showGameOverDialog(
            context,
            game.score,
            game.reset,
          );
        }
      },
      builder: (BuildContext context, List<Object> candidateData, List<dynamic> rejectedData) {
        return Block(itemSize: itemSize, currX: currX, currY: currY);
      },
    );
  }
}
