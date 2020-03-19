import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/models/lostUser.dart';
import 'package:lost_and_found/screens/home/settings_form.dart';
import 'package:lost_and_found/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:lost_and_found/services/database.dart';
import 'package:lost_and_found/screens/home/lostUser_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<LostUser>>.value(
      value: DatabaseService().lostUsers,
      child: Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        title: Text('Lost and Found'),
        backgroundColor: Colors.black26,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async{
              await _auth.signOut();

            },
          ),
        FlatButton.icon(
          onPressed: ()=> _showSettingsPanel(),
           icon: Icon(Icons.settings),
            label: Text('settings'),
            )
        ],
      ),
      body: LostUserList(),
      ),
    );
  }
}