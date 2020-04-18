import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = [
      {
        'questionText': 'What\'s your favorate color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favorate animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 7},
          {'text': 'Cat', 'score': 4},
          {'text': 'Dog', 'score': 6},
          {'text': 'Lion', 'score': 9},
        ],
      },
      {
        'questionText': 'What\'s is better?',
        'answers': [
          {'text': 'RN', 'score': 5},
          {'text': 'Flutter', 'score': 5},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: (_questionIndex < _questions.length)
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
