import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lost_and_found/models/lostUser.dart';
import 'package:lost_and_found/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference lostUserCollection= Firestore.instance.collection('Users');

  Future updateUserData(String location, String name, String object) async{
    return await lostUserCollection.document(uid).setData({
      'location' : location,
      'name' : name,
      'object' : object,
    });
  }

  //lostUser list from snapshot
  List<LostUser> _lostUserListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return LostUser(
        name: doc.data['name']?? '',
        location: doc.data['location']?? '0' ,
        object: doc.data['object']?? '0',    
      );
    }).toList();
  }
  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      location: snapshot.data['location'],
      object: snapshot.data['object'] ,
    );
  }

  //get lostUsers stream
  Stream<List<LostUser>> get lostUsers {
    return lostUserCollection.snapshots()
      .map(_lostUserListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData{
    return lostUserCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
    
  }

}