import 'package:flutter/material.dart';
import 'package:flutter_app/model/task.model.dart';

// stless - type keyword utk kluar extends StatelessWidget
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('My Test List App'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is snackbar')));
              },
              icon: const Icon(Icons.add_alert_rounded),
              tooltip: 'Show SnackBar',
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                  taskList.length,
                  (index) {
                    return TaskCointainer(task: taskList[index]);
                  },
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  taskList.length,
                  (index) {
                    return TaskCointainer(task: taskList[index]);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

class TaskCointainer extends StatelessWidget {
  final Task task;

  TaskCointainer({required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
              Icon(Icons.delete)
            ],
          ),
        ),
      ),
    );
  }
}
