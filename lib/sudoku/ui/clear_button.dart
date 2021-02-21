import 'package:flutter/material.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:provider/provider.dart';

class ClearButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Sudoku>(builder: (context, game, child) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FlatButton(
          onPressed: () {
            game.playNumber(0);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          color: Colors.brown.shade400,
          child: Icon(Icons.clear),
        ),
      );
    });
  }
}
