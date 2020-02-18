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
  var questions =['which is ur favourite colour','which is ur favourite animal','wh0 is ur favourite hero'];
  void answerdescription() {
    setState(() {
      index = index + 1;
    });

   
  }
    @override
    Widget build(BuildContext context)
    {
      return (MaterialApp(home: Scaffold(
          appBar:AppBar(title: Text('my first app'),) ,
          body: Column(
            children: [
              Text(questions[index]),
              RaisedButton(
                  child:Text('answer1'),
                  onPressed: answerdescription
              ),
              RaisedButton(
                  child:Text('answer2'),
                  onPressed: answerdescription
              ),
              RaisedButton(
                  child:Text('answer3'),
                  onPressed: answerdescription
              )
            ],)),));
    }
  }

