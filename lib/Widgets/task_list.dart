import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:todoey/controllers/tasksController.dart';
import 'package:todoey/models/task.dart';

class TasksList extends StatelessWidget {
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TasksController>(context).tasks;
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          index: index,
        );
      },
      itemCount: tasks.length,
    );
  }
}
