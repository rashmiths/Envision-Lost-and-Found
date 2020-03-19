import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lost_and_found/models/lostUser.dart';
import 'package:lost_and_found/screens/home/PhotoUpload.dart';
import 'package:lost_and_found/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:lost_and_found/services/database.dart';
import 'package:lost_and_found/screens/home/lostUser_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {


    return StreamProvider<List<LostUser>>.value(
      value: DatabaseService().lostUsers,
      child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Lost and Found'),
        backgroundColor: Colors.pink,
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
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)
                {
                  return new UploadPhotoPage();
                })
            );
          },
           icon: Icon(Icons.add_a_photo),
            label: Text('add a photo'),
            )
        ],
      ),
      body: DefaultTabController(length: 1, child:TabBarView(children: <Widget>[FlatButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("lost photos"))],),
      ),
    ));
  }
}