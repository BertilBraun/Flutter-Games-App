
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:games/sliding_15/logic/sliding_15.dart';

class Block extends StatelessWidget {
  const Block({
    Key key,
    @required this.itemSize,
    @required this.index,
  }) : super(key: key);

  final int index;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<Sliding15>(
      builder: (context, game, child) {
        int value = game.getValueAt(index);
        if (value == null) {
          return SizedBox(
            width: itemSize,
            height: itemSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.1,
                  ),
                  color: Colors.brown.shade300),
            ),
          );
        } else {
          return SizedBox(
            width: itemSize,
            height: itemSize,
            child: DecoratedBox(
              child: Center(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.1,
                  ),
                  color: Colors.brown.shade300),
            ),
          );
        }
      },
    );
  }
}
