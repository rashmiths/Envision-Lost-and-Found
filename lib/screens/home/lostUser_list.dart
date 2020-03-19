import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/models/lostUser.dart';
import 'package:provider/provider.dart';
import 'package:lost_and_found/screens/home/lostUser_tile.dart';

class LostUserList extends StatefulWidget {
  @override
  _LostUserListState createState() => _LostUserListState();
}

class _LostUserListState extends State<LostUserList> {
  @override
  Widget build(BuildContext context) {

    final lostUsers= Provider.of<List<LostUser>>(context);
    lostUsers.forEach((lostUser){
      print(lostUser.name);
      print(lostUser.location);
      print(lostUser.object);
    });

    return ListView.builder(
      itemCount: lostUsers.length,
      itemBuilder: (context, index){
        return LostUserTile(lostUser: lostUsers[index]);
      },
      
    );
  }
}