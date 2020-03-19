import 'package:flutter/material.dart';
import 'package:lost_and_found/models/user.dart';
import 'package:lost_and_found/services/database.dart';
import 'package:lost_and_found/shared/constants.dart';
import 'package:lost_and_found/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  //final List<String> object = ['Cash', 'Watch', 'Umberella', 'Others'];
  
   // form values
  String _currentName;
  String _currentLocation;
  String _currentObject;

  @override
  Widget build(BuildContext context) {


    User user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        //if(snapshot.hasData)
        {

          UserData userData= snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your data.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                //initialValue: userData.name,
                decoration: textInputDecoration.copyWith(hintText: 'Name'),
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),

                TextFormField(
                 // initialValue: userData.location,
                decoration: textInputDecoration.copyWith(hintText: 'Location'),
                validator: (val) => val.isEmpty ? 'Please enter the location' : null,
                onChanged: (val) => setState(() => _currentLocation = val),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  //initialValue: userData.object,
                decoration: textInputDecoration.copyWith(hintText: 'Object'),
                validator: (val) => val.isEmpty ? 'Please enter the object' : null,
                onChanged: (val) => setState(() => _currentObject = val),
                ),
                SizedBox(height: 10.0),
                //dropdown
                /*DropdownButtonFormField(
                  value: _currentObject ?? '0',
                  decoration: textInputDecoration.copyWith(hintText: 'Object'),
                  items: object.map((thing) {
                    return DropdownMenuItem(
                      value: thing,
                      child: Text('$thing'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentObject = val ),
                ),*/
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    print(_currentName);
                    print(_currentLocation);
                    print(_currentObject);
                  }
                ),

              ],
            ),
        );

        }/*else{
          //return Loading();

        }*/
        
      }
    );
  }
}