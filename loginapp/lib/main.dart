import 'package:flutter/material.dart';

void main()=> runApp( new  MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LoginPage(),
      theme:new ThemeData(
        primarySwatch: Colors.blue
      )
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState()=> new LoginPageState();
}
class LoginPageState extends State<LoginPage>
{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Stack(
        children: <Widget>[
          new Image(image: new AssetImage("assets/walpaper.jpg"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode:BlendMode.darken,
          ),
        new Column(
          children: <Widget>[
            new FlutterLogo(
              size: 8,
            )
          ],
        )]
      ),
    );

  }
}