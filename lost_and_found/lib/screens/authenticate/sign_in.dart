import 'package:lost_and_found/services/auth.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget{
  @override
  _SignInState createState()=> _SignInState();
}
class _SignInState extends State<SignIn>
{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.blue,
      body:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
             Image(image:  AssetImage("assets/1.jpeg"),
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode:BlendMode.darken,
            ),
             Image(image:  AssetImage("assets/nitk1.jpeg",),

            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 FlutterLogo(
                  size:0
                ),
                Form(
                  child : Theme(
                    data: ThemeData(
                    brightness: Brightness.dark,primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color:Colors.teal,
                        )
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                         TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter EmailId",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                         TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter password ",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        
                        //Though email id and password are taken here, for now anonymous method is tried to be
                        //taken here(Change this later)

                         //if there is an error later, try to change RaisedButton to MaterialButton and add height
                         RaisedButton(
                          color:Colors.teal,
                          textColor: Colors.white,
                          child:  Text("login"),
                            onPressed: () async {
                            dynamic result = await _auth.signInAnon();
                            if(result == null){
                              print('error signing in');
                            } else {
                              print('signed in');
                              print(result.uid);
                            }
                          },
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
