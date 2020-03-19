import 'package:flutter/material.dart';
import 'package:lost_and_found/models/lostUser.dart';

class LostUserTile extends StatelessWidget {

  final LostUser lostUser;
  LostUserTile({this.lostUser}); 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.pinkAccent,
          ),
          title: Text(lostUser.name),
          subtitle: Text('found ${lostUser.object} at ${lostUser.location}'),
        ),
      )
    );
  }
}