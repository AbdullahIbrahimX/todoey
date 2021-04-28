import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:todoey/controllers/tasksController.dart';

class TasksList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, taskController, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: () {
                taskController.toggleDone(task);
              },
            );
          },
          itemCount: taskController.tasks.length,
        );
      },
    );
  }
}
