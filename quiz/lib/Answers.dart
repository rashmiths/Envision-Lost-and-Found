import 'package:flutter/material.dart';
import 'main.dart';

class Answers extends StatelessWidget {
  var answers,answerindex;
  Function changer1,changer2,changer3;
  Answers(this.answers,this.answerindex,this.changer1,this.changer2,this.changer3);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.black,
          padding: EdgeInsets.all(10.0),
          child: Text(answers[answerindex],style: TextStyle(color: Colors.white),),
          onPressed: changer1,
        ),
        RaisedButton(
          color: Colors.black,
          padding: EdgeInsets.all(10.0),
          child: Text(answers[answerindex+1],style: TextStyle(color: Colors.white),),
          onPressed: changer2,
        ),
        RaisedButton(
          color: Colors.black,
          padding: EdgeInsets.all(10.0),
          child: Text(answers[answerindex+2],style: TextStyle(color: Colors.white),),
          onPressed: changer3,
        )
      ],
    );
  }
}
