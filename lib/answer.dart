import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //use final when value changes initially.
  //At runtime final makes the variable to lock at that value.
  //At complie time, final let the variable be free.
  final Function selectHandler;
  final String answerText;

  Answer({this.selectHandler, this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          primary: Colors.lightBlueAccent,
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          onPrimary: Colors.indigo,
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
