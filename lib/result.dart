import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double overallScore;
  Result({this.overallScore});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Well Done\n You got the score of ${overallScore.round().toString()}',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
