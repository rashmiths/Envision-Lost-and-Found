import 'package:flutter/material.dart';
import 'package:lost_and_found/screens/authenticate/authenticate.dart';
import 'package:lost_and_found/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //return either home or authenticate widget
    return Authenticate();
  }
}