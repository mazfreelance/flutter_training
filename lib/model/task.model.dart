class Task {
  String title;
  String description;

  Task({required this.title, required this.description});

  static Task fromMap(Map<String, dynamic> data) {
    return Task(
        title: data['title'] as String,
        description: data['description'] as String);
  }

  Map<String, Object> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
}

/* List<Task> taskList = [
  Task(title: 'task 1', description: 'task 1 teasdsadsad'),
  Task(title: 'task 2', description: 'task 2 asdasdsadas'),
  Task(title: 'task 3', description: 'task 3 sadsadsadaqe123'),
  Task(title: 'task 4', description: 'task 4 sadsadsadaqe123'),
  Task(title: 'task 5', description: 'task 5 sadsadsadaqe123')
]; */