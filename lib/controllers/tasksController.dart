import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksController extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: "Do Cv"),
    Task(name: "Change jobs"),
    Task(name: "Fuck the world"),
  ];

  String getUndoneTasksCount() {
    return _tasks.where((element) => !element.isDone).length.toString();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  // Task getTask(int index) {
  //   return _tasks[index];
  // }

  int getItemCount() {
    return _tasks.length;
  }
}
