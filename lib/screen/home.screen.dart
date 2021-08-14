import 'package:flutter/material.dart';
import 'package:flutter_app/model/task.model.dart';
import 'package:flutter_app/providers/task-list.provider.dart';
import 'package:provider/provider.dart';

// stless - type keyword utk kluar extends StatelessWidget
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListProvider>(
      create: (context) => TaskListProvider(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Awesome List App'),
            ),
            body: Consumer<TaskListProvider>(
              builder: (context, taskListProvider, child) {
                final taskList = taskListProvider.taskList;
                return ListView(
                  children: List.generate(
                    taskList.length,
                    (i) {
                      return TaskContainer(
                        task: taskList[i],
                        index: i,
                      );
                    },
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final taskListProvider =
                    Provider.of<TaskListProvider>(context, listen: false);
                final taskList = taskListProvider.taskList;
                final newTask = Task(
                    title: 'Task ${taskList.length + 1}',
                    description: 'Task ${taskList.length + 1} Description');
                taskListProvider.addTask(newTask);
                
                // taskList.add(newTask);
                // setState(() {}); /// for statefulwidget update widget component
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

class TaskContainer extends StatelessWidget {
  final Task task;
  final int index;

  TaskContainer({required this.task, required this.index});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    task.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // print(taskList[index].title);
                  // taskList.removeAt(widget.index);
                  // print(taskList.length);
                },
              ),
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  final taskListProvider =
                      Provider.of<TaskListProvider>(context, listen: false);
                  taskListProvider.deleteTask(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}