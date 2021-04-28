import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TasksController extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "Do Cv"),
    Task(name: "Change jobs"),
    Task(name: "Fuck the world"),
  ];

  String getUndoneTasksCount() {
    return tasks.where((element) => !element.isDone).length.toString();
  }

  void addTask(String taskName) {
    tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleDone(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }
}
