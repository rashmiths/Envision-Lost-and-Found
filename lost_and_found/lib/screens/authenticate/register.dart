import 'package:flutter/material.dart';
import 'package:lost_and_found/services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final AuthService _auth = AuthService();
final _formKey= GlobalKey<FormState>();

    //text field state
  String email = '';
  String password = '';
  String error= '';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[100],
        elevation: 0.0,
        title: Text('Sign up to Lost and Found'),
        actions: <Widget>[
          FlatButton.icon(
           onPressed: (){
             widget.toggleView();
           },
           icon: Icon(Icons.person),
           label: Text('Sign In'),
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
                          decoration: InputDecoration(
                            hintText: "Enter EmailId",
                          ),
                          keyboardType: TextInputType.text,
                        ),
                         TextFormField(
                           validator: (val) => val.length<6 ? 'Password should be atleast 6 characters long': null,
                           
                           onChanged: (val){
                             setState(() => password= val);

                                  },
                          decoration: InputDecoration(
                            hintText: "Enter password ",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        
                        RaisedButton(
                          color:Colors.teal,
                          textColor: Colors.white,
                          child:  Text("Register"),
                            onPressed: () async {
                              if(_formKey.currentState.validate()){
                                dynamic result= await _auth.registerWithEmailAndPassword(email, password);
                                if(result== null){
                                  setState(()=> error= 'please supply a valid email');

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