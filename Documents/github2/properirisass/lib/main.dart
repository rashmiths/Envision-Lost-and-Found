import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iris_assingment/model/taskclass.dart';
import './ListOfTasks.dart';
import './NewTasks.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' ;

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  print('opening directory');
  final directory=await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TaskAdapter());
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.grey,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: FutureBuilder(
        future: Hive.openBox('todo'),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            } else{
              print('OpenedBox');
              return MyHomePage();
            }
          } else{
            return Scaffold();
          }

        })
    );
  }
   @override
  void dispose(){
    Hive.close();
    print('closed box');
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {

  void addingTasks(BuildContext context){

  showModalBottomSheet(context: context, builder: (_){

   return NewTasks();
  }
  );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO',
          style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.black,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              width: double.infinity,
              height: 100,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text(
                    DateFormat.d().format(DateTime.now()),
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
                title: Text(DateFormat.yMMM().format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 24)),
                subtitle: Text(DateFormat.EEEE().format(DateTime.now()),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 18)),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlue.withOpacity(0.7), Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            ListOfTasks(),

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            addingTasks(context);
          },
        ),
      ),
    );
  }
}
