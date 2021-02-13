
import 'package:flutter/material.dart';

class GameListData {
  final Widget Function() gameProvider;
  final Color color;
  final IconData icon;

  const GameListData(this.gameProvider, this.color, this.icon);
}
