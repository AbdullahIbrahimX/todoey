import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/controllers/tasksController.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final int index;

  TaskTile({this.isChecked, this.taskTitle, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (s) {
          Provider.of<TasksController>(context, listen: false)
              .toggleDone(index);
        },
      ),
    );
  }
}
