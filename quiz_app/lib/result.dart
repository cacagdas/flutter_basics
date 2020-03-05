import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (resultScore >= 24)
      resultText = 'Awesome!';
    else if (resultScore >= 16)
      resultText = 'Good!';
    else if (resultScore >= 8)
      resultText = 'Meh!';
    else
      resultText = 'Bad!';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text(
                  'Restart Quiz!'
              ),
              textColor: Colors.blue,
              onPressed: resetHandler,
            )
          ],
        )
    );
  }
}
