
import 'package:flutter/material.dart';
import 'package:games/_widgets/game_provider.dart';
import 'package:games/slide_2048/logic/slide_2048.dart';
import 'package:games/slide_2048/slide_2048_settings.dart';
import 'package:games/slide_2048/ui/slide_2048_page.dart';

class Slide2048Provider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GameProvider<Slide2048>(
      title: "2048",
      pageBuilder: (_) => Slide2048Page(),
      gameProvider: (_) => Slide2048(Settings.size),
    );
  }
}
