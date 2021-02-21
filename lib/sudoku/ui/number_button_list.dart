import 'package:flutter/material.dart';
import 'package:games/sudoku/sudoku_settings.dart';
import 'package:games/sudoku/ui/clear_button.dart';
import 'package:games/sudoku/ui/number_button.dart';

class NumberButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(shrinkWrap: true, crossAxisCount: 5, children: [
        ...List.generate(
          Settings.size,
          (index) => NumberButton(
            index: index,
          ),
        ),
        ClearButton(),
      ]),
    );
  }
}
