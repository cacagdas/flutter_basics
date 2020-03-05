import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

/*void main() {
  runApp(MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    //you can make the value constant, too
    //Map
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 9},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 6},
       ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        { 'text': 'Rabbit', 'score': 9},
        {'text': 'Snake', 'score': 6},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 10},
       ],
    },
    {
      'questionText': 'Who\'s your favorite coder?',
      'answers': [
        {'text': 'Ali', 'score': 10},
        {'text': 'Cagdas', 'score': 10},
        {'text': 'Colak', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
