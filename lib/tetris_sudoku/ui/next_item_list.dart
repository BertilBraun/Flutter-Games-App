
import 'package:flutter/material.dart';
import 'package:games/tetris_sudoku/logic/drag_data.dart';
import 'package:games/tetris_sudoku/logic/piece.dart';
import 'package:games/tetris_sudoku/logic/tetris_sudoku.dart';
import 'package:games/tetris_sudoku/ui/block_item_preview.dart';
import 'package:games/tetris_sudoku/ui/empty_item_preview.dart';
import 'package:provider/provider.dart';

class NextItemList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TetrisSudoku>(
      builder: (context, game, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) {
            Piece piece = game.nextPieces[index];
            if (piece == null)
              return EmptyItemPreview();
            else
              return Draggable<DragData>(
                data: DragData(piece, index),
                child: BlockItemPreview(piece: piece, size: 25),
                childWhenDragging: EmptyItemPreview(),
                feedback: BlockItemPreview(piece: piece, size: 20),
              );
          }),
        );
      }
    );
  }
}
