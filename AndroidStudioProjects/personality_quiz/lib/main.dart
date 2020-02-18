import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyappState();
  }
}
class _MyappState extends State<Myapp>
{
  var index=0;
  var a=0;
  var questions =['which is ur favourite colour','which is ur favourite animal','wh0 is ur favourite hero'];
  var answers=['red','blue','green','cat','dog','tiger','sharukh','salman','amir'];
  var toast;
  void answerdescription() {
    setState(() {
      if(index<=2) {
        index = index + 1;
        a = a + 3;
      }
      else{
        toast="cdacad";
      }
    });


  }
  @override
  Widget build(BuildContext context)
  {
    var display;
    if(index==3){
      display=toast;
    }
    else{
      display=questions[index];

    }
    return (MaterialApp(home: Scaffold(
        appBar:AppBar(title: Text('my first app'),) ,
        body: Column(
          children: [


                Text(display),
                RaisedButton(

                    child: Text(answers[a]),
                    onPressed: answerdescription
                ),
                RaisedButton(
                    child: Text(answers[a + 1]),
                    onPressed: answerdescription
                ),
                RaisedButton(
                    child: Text(answers[a + 2]),
                    onPressed: answerdescription
                ),


          ],)),));
  }
}

