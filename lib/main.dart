import 'package:flutter/material.dart';
import 'package:flutter_app/providers/task-list.provider.dart';
import 'package:flutter_app/screen/home.screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'model/task.model.dart';

void main() async {
  await GetStorage.init(); // init get storage plugin
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // if have get storage plugin
    // read exist data
    final taskList = box.read('taskList');
    final List<Task> list = taskList != null
        ? List.from((taskList as List<dynamic>).map((e) => Task.fromMap(e)))
        : [];
    final taskListProvider = TaskListProvider(taskList: list);

    // if dont have get storage plugin
    // final taskListProvider = TaskListProvider();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskListProvider>.value(value: taskListProvider),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          // home: MyHomePage(title: 'test title',),
          home: HomeScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key? key, required this.title}) : super(key: key);
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // Scaffold , Material
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',
                style: TextStyle(color: Colors.amber, fontSize: 30)),
            Text('$_counter',
                // style: Theme.of(context).textTheme.headline4,
                style: TextStyle(color: Colors.green, fontSize: 30)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
