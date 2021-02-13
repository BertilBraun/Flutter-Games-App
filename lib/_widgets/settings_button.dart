import 'package:flutter/material.dart';
import 'package:games/_logic/global_settings.dart';
import 'package:games/_widgets/settings_dialog.dart';
import 'package:provider/provider.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FlatButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext _) {
            return ChangeNotifierProvider<GlobalSettings>.value(
              value: context.watch<GlobalSettings>(),
              child: SettingsDialog(),
            );
            return SettingsDialog();
          },
        );
      },
      child: Icon(
        Icons.settings,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
