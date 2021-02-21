import 'package:flutter/material.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:provider/provider.dart';

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

    return Consumer<Sudoku>(
      builder: (context, game, child) {
        int value = game.getValueAt(index);
        bool correct = game.isCorrectAt(index);
        bool preset = game.isPresetAt(index);
        bool selected = game.selectedIndex == index;

        Widget child;
        if (value != 0) {
          child = Center(
              child: Text(
            value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: correct ? Colors.black87 : Colors.red,
            ),
          ));
        }

        return SizedBox(
          width: itemSize,
          height: itemSize,
          child: FlatButton(
            onPressed: () {
              game.selectedIndex = index;
            },
            color: selected ? Colors.brown.shade200 : preset ? Colors.brown.shade400 : Colors.brown.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
