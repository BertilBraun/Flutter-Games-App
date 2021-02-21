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
      return GameDialog(
        onRestart: () {
          onRestart();
          Navigator.of(context).pop();
        },
        score: score,
        highscore: highscore,
        title: 'Game Over',
      );
    },
  );
}

Future<void> showGameWonDialog(BuildContext context, int score, Function onRestart) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int highscore = prefs.getInt('highscore') ?? 0;
  if (score > highscore) await prefs.setInt('highscore', score);

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GameDialog(
        title: 'You Won!',
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

class GameDialog extends StatelessWidget {
  final Function onRestart;
  final int score;
  final int highscore;
  final String title;

  const GameDialog(
      {Key key,
      @required this.onRestart,
      @required this.score,
      @required this.highscore,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: onRestart,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
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
