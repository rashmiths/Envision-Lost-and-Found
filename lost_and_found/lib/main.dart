import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main()=> runApp( new  MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
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
          fit: StackFit.expand,
          children: <Widget>[
            new Image(image: new AssetImage("assets/1.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode:BlendMode.darken,
            ),
            new Image(image: new AssetImage("assets/nitk1.jpeg",),

            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new FlutterLogo(
                  size:0
                ),
                new Form(
                  child : Theme(
                    data: new ThemeData(
                    brightness: Brightness.dark,primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                          color:Colors.teal,
                        )
                      )
                    ),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter RegNo",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                         new TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Enter password ",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new MaterialButton(
                          color:Colors.teal,
                          height: 40,
                          textColor: Colors.white,
                          child: new Text("login"),
                          onPressed: ()=>{},
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ),
                  )

                )
              ],
            )]
      ),
    );

  }
}