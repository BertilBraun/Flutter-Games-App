import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showGameOverDialog(BuildContext context, int score, Function onRestart) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int highscore = prefs.getInt('highscore') ?? 0;
  if (score > highscore) await prefs.setInt('highscore', score);

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GameOverDialog(
        onRestart: () {
          onRestart();
          Navigator.of(context).pop();
        },
        score: score,
        highscore: highscore,
      );
    },
  );
}

class GameOverDialog extends StatelessWidget {
  final Function onRestart;
  final int score;
  final int highscore;

  const GameOverDialog({Key key, @required this.onRestart, @required this.score, @required this.highscore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: onRestart,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Game Over"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          (highscore < score) ? Text("Congratulations!") : Container(),
          (highscore < score) ? Text("New Highscore: $score!") : Container(),
          SizedBox(height: 20),
          Text("Would you like to restart the game?"),
        ],
      ),
      actions: [
        okButton,
      ],
    );
    return alert;
  }
}
