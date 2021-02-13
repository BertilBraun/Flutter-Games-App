
import 'package:flutter/material.dart';

class GameListData {
  final Widget Function() gameProvider;
  final Color color;
  final IconData icon;

  GameListData(this.gameProvider, this.color, this.icon);
}
