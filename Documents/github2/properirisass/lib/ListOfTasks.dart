import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iris_assingment/model/taskclass.dart';
import './Dummy_Data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListOfTasks extends StatefulWidget {
  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  var data = dummyCategories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'Tasks',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Container(height: 400, child: todobuilder()),
      ],
    );
  }

  todobuilder() {
    final todobox=Hive.box('todo');
    ValueListenableBuilder(
      builder: (context, Box todo, Widget child) {
        return child;
      },
      valueListenable: Hive.box('todo').listenable(),
      child: ListView.builder(
        
          itemBuilder: (ctxt, index) {
            final todoitem=todobox.getAt(index) as Task;
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 8,
              ),
              child: ListTile(
                  leading: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: FittedBox(
                          child: Text(
                            '# ${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                  title: FittedBox(
                    child: Text(
                      // data[index].title,
                      todoitem.title,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 6,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text(
                    
                    //data[index].time
                    todoitem.time
                    
                    ),
                  trailing:
                      IconButton(icon: Icon(Icons.delete), onPressed: () {
                        todobox.deleteAt(index);
                      })),
            );
          },
          itemCount: todobox.length),
    );
  }
}
