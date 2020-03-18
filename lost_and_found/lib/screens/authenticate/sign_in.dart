import 'dart:ffi';

import 'package:lost_and_found/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/shared/constants.dart';
import 'package:lost_and_found/shared/loading.dart';


class SignIn extends StatefulWidget{

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState()=> _SignInState();
}
class _SignInState extends State<SignIn>
{
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context){
    return loading? Loading() : Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        title: Text('Sign in to Lost and Found'),
        actions: <Widget>[
          FlatButton.icon(
           onPressed: (){
              widget.toggleView();
           },
           icon: Icon(Icons.person),
           label: Text('Register'),
           )
        ],
        ),
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
                  key: _formKey,
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
                          validator: (val) => val.isEmpty ? 'Enter an email': null,
                          onChanged: (val){
                            setState(() => email= val);

                          },
                          decoration: textInputDecoration.copyWith(hintText: 'Email'),
                          keyboardType: TextInputType.text,
                        ),
                         TextFormField(
                          validator: (val) => val.length<6 ? 'Password should be atleast 6 characters long': null,
                           onChanged: (val){
                             setState(() => password= val);

                                      },
                          decoration: textInputDecoration.copyWith(hintText: 'Password'),
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
                              if(_formKey.currentState.validate()){
                                setState(()=> loading= true);
                                dynamic result= await _auth.signInWithEmailAndPassword(email, password);

                                if(result== null){
                                  setState(() {error= 'Could not sign in with those credentials';
                                  loading= false;
                                  });
                                }

                                print(email);
                                print(password);

                              }
                          },
                          splashColor: Colors.redAccent,
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
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
