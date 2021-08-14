import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/task.model.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> taskList = [
    Task(title: 'task 1', description: 'task 1 teasdsadsad'),
    Task(title: 'task 2', description: 'task 2 asdasdsadas'),
    Task(title: 'task 3', description: 'task 3 sadsadsadaqe123')
  ];

  update() {
    notifyListeners();
  }

  addTask(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  deleteTask(int index) {
    taskList.removeAt(index);
    notifyListeners();
  }
}
