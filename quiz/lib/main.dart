import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'QUESTIONS.dart';
import 'Answers.dart';
import 'Results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questions = [
    'which is ur favourite animal',
    'which is ur favourite colour',
     'which is ur favourite sport',

  ];
  List<String> answer = List<String>(100);
  var answers=[ 'cat', 'dog', 'horse','red', 'black', 'green','cricket', 'football', 'kabadi'];
  var questionindex = 0,answerindex=0;
  void change()
  {
    setState(() {
      questionindex = 0;
      answerindex=0;
    });

  }
  void changer1()
  {
    answer[questionindex]= answers[answerindex];

    setState(() {
      questionindex=questionindex+1;
      answerindex=answerindex+3;

    });
  }
  void changer2()
  {
    answer[questionindex]= answers[answerindex+1];
    setState(() {
      questionindex=questionindex+1;
      answerindex=answerindex+3;

    });
  }
  void changer3()
  {
    answer[questionindex]= answers[answerindex+2];
        setState(() {
      questionindex=questionindex+1;
      answerindex=answerindex+3;

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz',
            style: TextStyle(
            fontStyle: FontStyle.normal,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: questionindex<3?Column(
          children: <Widget>
            [
              QUESTIONS(questions,questionindex),
            Answers(answers,answerindex,changer1,changer2,changer3),

          ],
        ):
        Results(answer[0],answer[1],answer[2],change),
      ),
    );
  }
}
