
import 'package:flutter/material.dart';
import 'package:games/sliding_15/ui/game_grid.dart';

class Sliding15Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // StatusBar(),
          GameGrid(),
        ],
      ),
    );
  }
}
