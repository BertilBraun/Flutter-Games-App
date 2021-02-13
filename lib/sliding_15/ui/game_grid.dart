import 'package:flutter/material.dart';
import 'package:games/_widgets/game_over_dialog.dart';
import 'package:games/sliding_15/logic/drag_data.dart';
import 'package:games/sliding_15/logic/sliding_15.dart';
import 'package:games/sliding_15/sliding_15_settings.dart';
import 'package:provider/provider.dart';

class GameGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemSize = (MediaQuery.of(context).size.width * 0.95) / Settings.size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: Settings.size,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        shrinkWrap: true,
        children: List.generate(
          Settings.size * Settings.size,
          (index) {
            return DragTarget<DragData>(
              onWillAccept: (_) => true,
              onAccept: (data) async {
                var game = context.read<Sliding15>();
                
                bool wasMoved = game.moveFromTo(data.fromIndex, index);

                if (game.isGameOver()) {
                  await showGameOverDialog(
                      context,
                      -1,
                      game.shuffle,
                  );
                }
              },
              builder: (_, __, ___) {
                return Draggable<DragData>(
                  data: DragData(index),
                  child: Block(
                    itemSize: itemSize,
                    index: index,
                  ),
                  childWhenDragging: Block(
                    itemSize: itemSize,
                    index: index,
                  ),
                  feedback: Container(), // TODO A dragging direction could be displayed here
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Block extends StatelessWidget {
  const Block({
    Key key,
    @required this.itemSize,
    @required this.index,
  }) : super(key: key);

  final int index;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<Sliding15>(
      builder: (context, game, child) {
        int value = game.getValueAt(index);
        if (value == null) {
          return SizedBox(
            width: itemSize,
            height: itemSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.1,
                  ),
                  color: Colors.brown.shade300),
            ),
          );
        } else {
          return SizedBox(
            width: itemSize,
            height: itemSize,
            child: DecoratedBox(
              child: Center(
                  child: Text(
                value.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.1,
                  ),
                  color: Colors.brown.shade300),
            ),
          );
        }
      },
    );
  }
}
