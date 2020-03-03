import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  String  _email, _password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
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
              alignment: Alignment.topCenter,
              height: 0.1,
              width: 0.1,

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
                            hintText: "Enter email",
                          ),
                          keyboardType: TextInputType.text,
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
                          onPressed: ()=>{signIn()},
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
  Future<void> signIn() async{
    final formState = _formkey.currentState;
    if(formState.validate()){
      formState.save();
      try{
      FirebaseUser user =await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _password);
    }
    catch(e){
        print(e.message);
    }

  }
}