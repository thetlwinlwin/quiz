import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

//one widget per file is suggested.

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
} // this will rebulid, State will persistent.

// underscore infront of MyAppState suggests that this should not be reused out side of the file. eg: if you import to another file, underscore suggests that this MyAppState cannot be called.

class _MyAppState extends State<MyApp> {
  // the variable a.k.a 'que' will never change. Then we use const. This means the variable (pointer) is constant.
  // adding const in front of value will lock that value in the specific memory and cannot add or remove that value.
  // var que = const[1,2,4]
  // if we write like this, the variable 'que' can be re-asign like
  // que = 1 and this will erase the previous value a.k.a [1,2,4]

  final _que = const [
    {
      "questionText": "What's your fav color?",
      "answers": [
        {'text': 'Black', 'score': 5},
        {'text': 'little Black', 'score': 4},
        {'text': 'Not too Black', 'score': 3},
      ],
    },
    {
      "questionText": "What's fav meal?",
      "answers": [
        {'text': 'Steak', 'score': 4},
        {'text': 'Halibut', 'score': 3},
        {'text': 'Burger', 'score': 5},
      ],
    },
    {
      "questionText": "Fav dota hero?",
      "answers": [
        {'text': '-25MMR', 'score': 5},
        {'text': '-25MMR with friends', 'score': 4},
        {'text': 'Techies', 'score': 3},
      ],
    },
  ];

  var _totalScore = 0;

  void _ansQue(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    //print('Answer chosen!');
    //print(_questionIndex);
    _totalScore += score;
  }

  var _questionIndex = 0;
  //this should be outside of the bulid Widget as it will re-render and Index will be reset to zero everytime.

  @override //we are overiding build method.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mother Fuckers'),
        ),
        body: _questionIndex < _que.length
            ? Quiz(
                answerQuestion: _ansQue,
                questions: _que,
                questionIndexx: _questionIndex,
              )
            : Result(
                overallScore: _totalScore / _que.length,
              ),
      ),
    );
  }
}
