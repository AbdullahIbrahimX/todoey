import 'package:flutter/material.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function checkboxCallback;

  TasksList({this.tasks, this.checkboxCallback});

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (checkboxState) {
            checkboxCallback(index);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
