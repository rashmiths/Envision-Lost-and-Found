import 'package:flutter/material.dart';
import 'package:lost_and_found/services/auth.dart';
import 'package:flutter/rendering.dart';
import 'package:lost_and_found/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:lost_and_found/models/user.dart';

void main()=> runApp( MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //implement build
    return StreamProvider<User>.value(
        value: AuthService().user,
          child: MaterialApp(
            
          debugShowCheckedModeBanner: false,
          home: Wrapper(),

      ),
    );
  }
}

