import 'package:flutter/material.dart';
import 'package:games/_widgets/settings_button.dart';
import 'package:provider/provider.dart';

class GameProvider<Game extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext) pageBuilder;
  final Game Function(BuildContext) gameProvider;
  final String title;
  final List<Widget> actionButtons;

  const GameProvider({
    Key key,
    this.pageBuilder,
    this.gameProvider,
    this.title,
    this.actionButtons = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Game>(
      create: gameProvider,
      lazy: false,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              ...actionButtons,
              SettingsButton(),
            ],
          ),
          body: pageBuilder(context),
        );
      },
    );
  }
}
