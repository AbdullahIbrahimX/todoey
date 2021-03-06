import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/controllers/tasksController.dart';
import 'package:todoey/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksController>(
      create: (context) => TasksController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
