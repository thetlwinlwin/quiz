import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndexx;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndexx});

  @override
  Widget build(BuildContext context) {
    return Column(
      // column aligment is always at the centre. So, after one of the widget which in this case Question Widget took full width. The rest of the widgets will go align according to Question Widget. That's why ElevatedButton is moved to the centre.
      children: <Widget>[
        Question(
          questionText: questions[questionIndexx]['questionText'],
        ),
        //in 'que[_questionIndex]['answers'].map', map does not recognize 'que[_questionIndex]['answers']' as a list. That's why it is wrapped in '()' and announce it as a List<String>.

        // after fixing map problem, the new problem appears. children accept multiple widget. But map does not spit out individual widget with comma. That's why we change the return value of map function into 'toList()' and '...' operator to spread out that list.

        // example [1,3,4].map((single){return single*2}).toList() will give [2,6,8] and ...[2,6,8] will output 2,6,8
        ...(questions[questionIndexx]['answers'] as List<Map<String, Object>>)
            .map((singleanswer) {
          return Answer(
            //if we write selectHandler : answerQuestion(singleanswer['score'])
            //The above code will give us error as we include parenthese
            //parenthese means the function will be executed instead of pointing to the function in main.dart.
            //That's why we pass anonymous function served as address.
            //This anonymous function will give answerQuestion with 'score' parameter and execute in main.dart.
            selectHandler: () => answerQuestion(
              singleanswer['score'],
            ),
            answerText: singleanswer['text'],
          );
        }).toList(),
      ],
    );
  }
}
