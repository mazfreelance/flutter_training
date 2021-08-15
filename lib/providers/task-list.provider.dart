import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/task.model.dart';
import 'package:get_storage/get_storage.dart';

class TaskListProvider extends ChangeNotifier {
  /* List<Task> taskList = [
    Task(title: 'task 1', description: 'task 1 teasdsadsad'),
    Task(title: 'task 2', description: 'task 2 asdasdsadas'),
    Task(title: 'task 3', description: 'task 3 sadsadsadaqe123')
  ]; */
  List<Task> taskList;

  TaskListProvider({required this.taskList});

  update() {
    final box = GetStorage(); // init get storage plugin
    box.write('taskList', taskList.map((e) => e.toMap()).toList());
    final list =
        box.read('taskList'); // read data exist from get storage plugin
    print(list);

    notifyListeners();
  }

  addTask(Task task) {
    taskList.add(task);
    update();
  }

  deleteTask(int index) {
    taskList.removeAt(index);
    update();
  }
}
