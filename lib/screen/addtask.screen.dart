import 'package:flutter/material.dart';
import 'package:flutter_app/model/task.model.dart';
import 'package:flutter_app/providers/task-list.provider.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  final titleTextController = new TextEditingController();
  final descriptionTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleTextController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descriptionTextController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // print(titleTextController.text);
                // print(descriptionTextController.text);

                final task = Task(
                    description: descriptionTextController.text,
                    title: titleTextController.text);
                Provider.of<TaskListProvider>(context, listen: false)
                    .addTask(task);
                Navigator.pop(context);
              },
              child: Text('Add Task'),
            )
          ],
        ),
      ),
    );
  }
}
