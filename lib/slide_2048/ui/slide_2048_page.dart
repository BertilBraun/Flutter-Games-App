
import 'package:flutter/material.dart';
import 'package:games/slide_2048/ui/game_grid.dart';
import 'package:games/slide_2048/ui/status_bar.dart';

class Slide2048Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StatusBar(),
          GameGrid(),
        ],
      ),
    );
  }
}
