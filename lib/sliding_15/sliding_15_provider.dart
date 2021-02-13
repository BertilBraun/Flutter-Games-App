
import 'package:flutter/material.dart';
import 'package:games/_widgets/game_provider.dart';
import 'package:games/sliding_15/sliding_15_settings.dart';
import 'package:games/sliding_15/logic/sliding_15.dart';
import 'package:games/sliding_15/ui/sliding_15_page.dart';

class Sliding15Provider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GameProvider<Sliding15>(
      title: "Sliding 15",
      pageBuilder: (_) => Sliding15Page(),
      gameProvider: (_) => Sliding15(Settings.size),
    );
  }
}
