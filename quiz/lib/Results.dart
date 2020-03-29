import 'package:flutter/material.dart';
import 'main.dart';

class  Results extends StatelessWidget {
  var a,b,c;
  Function change;
  Results(this.a,this.b,this.c,this.change);
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        Text('YOU HAVE COMPLETED THE QUIZ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),textAlign: TextAlign.center,),
        SizedBox(height: 100,),
        Container(
          color: Colors.black,
          padding:EdgeInsets.all(20.0) ,

          child:Text("your answers :\n$a\n$b\n$c",style: TextStyle(fontSize: 20,backgroundColor: Colors.black,color: Colors.white),),

        ),
        SizedBox(height: 40.0,),
       Row(
         children: <Widget>[
           SizedBox(width: 50,),
           FloatingActionButton(
             onPressed: change,
             tooltip: 'refresh',
             child: new Icon(
               Icons.refresh,

             ),
           )
         ],
       )

      ],
    );
  }
}
