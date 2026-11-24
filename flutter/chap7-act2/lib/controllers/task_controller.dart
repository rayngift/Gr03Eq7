import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskController extends ChangeNotifier {
  final List<Task> _todoTasks = [];
  final List<Task> _doneTasks = [];

  List<Task> get todoTasks => _todoTasks;
  List<Task> get doneTasks => _doneTasks;

  int get todoCount => _todoTasks.length;
  int get doneCount => _doneTasks.length;

  void addTask(String title) {
    final text = title.trim();
    if (text.isEmpty) return;
    _todoTasks.add(
      Task(id: DateTime.now().microsecondsSinceEpoch.toString(), title: text),
    );
    notifyListeners();
  }

  void completeTask(Task task) {
    _todoTasks.remove(task);
    _doneTasks.add(task);
    notifyListeners();
  }

  void deleteDoneTask(Task task) {
    _doneTasks.remove(task);
    notifyListeners();
  }

  // Bonus : "Tout effacer"
  void clearDone() {
    _doneTasks.clear();
    notifyListeners();
  }

  void clearTodo() {
    _todoTasks.clear();
    notifyListeners();
  }
}