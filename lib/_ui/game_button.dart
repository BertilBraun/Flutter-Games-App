import 'package:flutter/material.dart';
import 'package:games/_logic/game_list_data.dart';
import 'package:games/_ui/game_list.dart';
import 'package:games/_util/Navigation.dart';

class GameButton extends StatelessWidget {
  final GameListData data;

  const GameButton({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / GameList.gamesPerRow - 20;

    return FlatButton(
      onPressed: () {
        Navigation.push(context, data.gameProvider());
      },
      color: data.color,
      child: Icon(
        data.icon,
        size: 50,
        color: Colors.white,
      ),
      height: size,
      minWidth: size,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
