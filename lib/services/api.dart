import 'package:dio/dio.dart';
import 'package:flutter_app/model/todo.model.dart';

Future<List<Todo>> getTodo() async {
  try {
    Response response = await Dio()
        .get('https://jsonplaceholder.typicode.com/todos'); // 200 lists
    // print(response.data); // dalam bentuk dynamic? Kena convert kepada object Task
    List<Todo> list = List.from(
        (response.data as List<dynamic>).map((e) => Todo.fromMap(e)).toList());
    // print(list);
    return list; // List<Todo>
  } catch (e) {
    print(e);
    return [];
  }
}
