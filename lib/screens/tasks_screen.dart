import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_list.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: "Do Cv"),
    Task(name: "Change jobs"),
    Task(name: "Fuck the world"),
  ];

  Widget buildBottomSheet(BuildContext context) {
    return Container();
  }

  // void addTask(String taskName) {
  //   setState(() {
  //     tasks.add(Task(name: taskName));
  //   });
  // }
  //
  // void checkboxCallback(int index) {
  //   setState(() {
  //     tasks[index].toggleDone();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(
                  addTask: (String taskName) {
                    setState(() {
                      tasks.add(Task(name: taskName));
                    });
                  },
                ),
              ),
            ),
          )
        },
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${tasks.where((element) => !element.isDone).length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: TasksList(
                tasks: tasks,
                checkboxCallback: (int index) {
                  setState(() {
                    tasks[index].toggleDone();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
