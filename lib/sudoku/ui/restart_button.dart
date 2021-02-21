import 'package:flutter/material.dart';
import 'package:games/sudoku/logic/sudoku.dart';
import 'package:provider/provider.dart';

class RestartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Sudoku>(builder: (context, game, child) {
      return FlatButton(
        onPressed: () {
          game.reset();
        },
        color: Colors.transparent,
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      );
    });
  }
}
