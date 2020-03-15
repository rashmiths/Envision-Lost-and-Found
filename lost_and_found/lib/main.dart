import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lost_and_found/screens/wrapper.dart';

void main()=> runApp( MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
    );
  }
}

