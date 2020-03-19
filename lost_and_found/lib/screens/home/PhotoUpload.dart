import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'home.dart';
class UploadPhotoPage extends StatefulWidget
{
  State<StatefulWidget> createState()
  {
    return _UploadPhotoPage();
  }
}


class _UploadPhotoPage extends State<UploadPhotoPage>
{
  File sampleImage;
  String _myvalue,_myvalue1,url;

  @override
  Widget build(BuildContext context)
  {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Upload image"),
          centerTitle: true,
        ),
        body: new Center(
          child : sampleImage == null?Text("select an image"):enableUpload(),
        ),
        floatingActionButton: new FloatingActionButton(onPressed: getImage,
          tooltip: 'Add a Image',
          child: new Icon(Icons.add_a_photo),)
    );
  }


  Widget enableUpload()
  {
    return new Container
      (
      child: new Form(
        key: formKey ,
        child: Column(
          children: <Widget>[
            Image.file(sampleImage,height: 220.0,width: 440.0,),
            TextFormField(
              decoration: InputDecoration(labelText: 'name'),
              validator: (value)
              {
                return value.isEmpty ? 'enter ur name':null;
              },
              onSaved: (value){
                return _myvalue=value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'phonenumber'),
              validator: (value1)
              {
                return value1.isEmpty ? 'enter ur phno':null;
              },
              onSaved: (value1){
                return _myvalue1=value1;
              },
            ),
            SizedBox(height: 10.0,),

            RaisedButton(
              elevation: 10.0,
              child: Text("add a new post"),
              textColor: Colors.white,
              color: Colors.pink,

              onPressed: uploadStatusImage,
            )

          ],
        ),
      ) ,
    );
  }


  final formKey =GlobalKey<FormState>();


  Future getImage() async
  {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage=tempImage;
    });
  }

 bool validateAndSave()
  {
   final form = formKey.currentState;

   if(form.validate())
    {
      form.save();
      return true;
    }
   else
    {
      return false;
    }

  }

void uploadStatusImage() async
{
  if (validateAndSave()) {
    final StorageReference postImageRef = FirebaseStorage.instance.ref().child(
        "Post Images ");

    var timekey = new DateTime.now();

    final StorageUploadTask uploadTask = postImageRef.child(
        timekey.toString() + ".jpg").putFile(sampleImage);

    var Imageurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = Imageurl.toString();
    print("Image Url= " + url);


    goToHomePage();
    saveToDatabase(url);
  }
}

      void saveToDatabase(url)
      {
        var dbTimeKey= DateTime.now();
        var formatDate=DateFormat('MMM d, yyyy');
        var formatTime=DateFormat('EEEE, hh:mm aaa');

        String date = formatDate.format(dbTimeKey);
        String time =formatTime.format(dbTimeKey);

        DatabaseReference ref = FirebaseDatabase.instance.reference();

        var data =
            {
              "image":url,
              "name":_myvalue,
              "phoneno":_myvalue1,
              "date": date,
              "time": time,
            };
        ref.child("posts").push().set(data);
      }

      void goToHomePage()
      {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)
        {
          return new Home();
        }
        )

        );
      }

    }



