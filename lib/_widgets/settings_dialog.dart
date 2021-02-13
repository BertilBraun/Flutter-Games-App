import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:games/_logic/global_settings.dart';
import 'package:provider/provider.dart';

class SettingsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text("Settings"),
        content: Consumer<GlobalSettings>(
          builder: (context, settings, child) {
            return Table(
              columnWidths: {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
              children: [
                TableRow(children: [
                  TableCell(
                    child: Text("Sound"),
                    verticalAlignment: TableCellVerticalAlignment.middle,
                  ),
                  TableCell(
                    child: Switch(
                      value: settings.soundOn,
                      onChanged: (value) => settings.soundOn = value,
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                    verticalAlignment: TableCellVerticalAlignment.middle,
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text("Music"),
                    verticalAlignment: TableCellVerticalAlignment.middle,
                  ),
                  TableCell(
                    child: Switch(
                      value: settings.musicOn,
                      onChanged: (value) => settings.musicOn = value,
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                    verticalAlignment: TableCellVerticalAlignment.middle,
                  ),
                ]),
                TableRow(children: [
                  TableCell(
                    child: Text("Vibration"),
                    verticalAlignment: TableCellVerticalAlignment.middle,
                  ),
                  TableCell(
                    child: Switch(
                      value: settings.vibrationOn,
                      onChanged: (value) => settings.vibrationOn = value,
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),
                    verticalAlignment: TableCellVerticalAlignment.middle,
                  ),
                ]),
              ],
            );
          },
        ),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
