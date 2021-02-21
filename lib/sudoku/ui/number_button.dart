import 'package:flutter/material.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:provider/provider.dart';

class NumberButton extends StatelessWidget {
  final int index;

  NumberButton({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Sudoku>(builder: (context, game, child) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FlatButton(
          onPressed: () {
            game.playNumber(index + 1);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          color: Colors.brown.shade400,
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ),
      );
    });
  }
}
