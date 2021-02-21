import 'package:flutter/material.dart';
import 'package:games/slide_2048/logic/slide_2048.dart';
import 'package:provider/provider.dart';

final Map<int, Color> boxColor = <int, Color>{
  2: Colors.brown[50],
  4: Colors.brown[100],
  8: Colors.brown[200],
  16: Colors.brown[300],
  32: Colors.brown[400],
  64: Colors.brown[500],
  128: Colors.brown[600],
  256: Colors.brown[700],
  512: Colors.brown[800],
  1024: Colors.pink[800],
  2048: Colors.pink[500],
};

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
    return Consumer<Slide2048>(
      builder: (context, game, child) {
        int value = game.getValueAt(index);

        Widget child;
        if (value != 0) {
          child = Center(
              child: Text(
            value.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ));
        }

        return SizedBox(
          width: itemSize,
          height: itemSize,
          child: DecoratedBox(
            child: child,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.8,
                ),
                color: boxColor[value]),
          ),
        );
      },
    );
  }
}
