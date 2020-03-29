import 'package:flutter/material.dart';
import 'main.dart';
import 'Answers.dart';

class  QUESTIONS extends StatelessWidget {
  var questions,questionindex;

  QUESTIONS(this.questions,this.questionindex,);
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        SizedBox(height: 50,),
        Container(
         alignment:Alignment.center,
        child:Text(questions[questionindex]+'?',style: TextStyle(fontSize: 24,color: Colors.black,),)

        ),
      ],
    );
  }
}
