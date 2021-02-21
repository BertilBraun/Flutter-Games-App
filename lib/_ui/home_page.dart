import 'package:flutter/material.dart';
import 'package:games/_ui/game_list.dart';
import 'package:games/_widgets/settings_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          SettingsButton(),
        ],
      ),
      body: GameList(),
    );
  }
}
