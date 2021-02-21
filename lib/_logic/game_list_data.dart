
import 'package:flutter/material.dart';

class GameListData {
  final Widget Function() gameProvider;
  final Color color = Colors.brown.shade500;
  final IconData icon;

  GameListData(this.gameProvider, this.icon);
}
