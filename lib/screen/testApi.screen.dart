import 'package:flutter/material.dart';
import 'package:flutter_app/model/todo.model.dart';
import 'package:flutter_app/services/api.dart';

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({Key? key}) : super(key: key);

  @override
  _TestApiScreenState createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  Future<List<Todo>> todoList = getTodo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Api'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoList,
        builder: (context, snapshot) {
          // print(snapshot);
          if (snapshot.data == null ||
              snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              snapshot.data!.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Todo> todoList = snapshot.data!;
            // Provider.of<TaskListProvider>(context, listen: false).todoList = todoList;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final Todo todo = todoList[index];
                // basic list
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Flexible(
                          fit: FlexFit.loose,
                          child: Text('${todo.id}. ${todo.title}')),
                      todo.completed
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                    ],
                  ),
                );
                // datatable list
                /* return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: todo.headerData.map<DataColumn>((e) {
                      var columnName = e;
                      TextAlign align;
                      if (columnName.contains('<')) {
                        align = TextAlign.start;
                        columnName = columnName.replaceAll('<', '');
                      } else if (columnName.contains('>')) {
                        align = TextAlign.end;
                        columnName = columnName.replaceAll('>', '');
                      } else {
                        align = TextAlign.center;
                      }

                      return DataColumn(
                          label: Text(
                        columnName,
                        textAlign: align,
                      ));
                    }).toList(),
                    rows: todo.rowData.map<DataRow>((e) {
                      return DataRow(
                          cells: e
                              .map<DataCell>((e) => DataCell(Text(e)))
                              .toList());
                    }).toList(),
                  ),
                ); */
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
