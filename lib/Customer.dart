import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:http/http.dart' as http;
Future<Todo> fetchTodo(int id) async {
  if (id == null) id = 1;
  final response = await http.get('http://134.255.228.171:3000/todos/' + id.toString());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Todo.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load customer');
  }
}

Future<List<Todo>> fetchTodos() async {
  final response = await http.get('http://134.255.228.171:3000/todos').timeout(Duration(seconds: 5),
  onTimeout: () {
    return null;
  });

  if (response.statusCode == 200) {
    final body = response.body;
    final jsonBody = json.decode(response.body);
    try {
      final list = (jsonBody as List).map((i) =>
          Todo.fromJson(i)).toList();
      return list;
    } catch(e) {
      return List<Todo>();
    }
  } else {
    // If the server did not return a 200 OK response, then throw an exception.
    return List<Todo>();
  }
}

class Todo {
  final int Id;
  final String Username;
  final String Title;
  final String Content;
  final DateTime Created;
  final DateTime Updated;
  final bool Done;

  Todo({this.Id, this.Username, this.Title, this.Content, this.Created, this.Updated, this.Done});

  factory Todo.fromJson(Map<String, dynamic> json) {
    final Todo todo = Todo(
        Id: json['Id'],
        Username: json['Username'],
        Title: json['Title'],
        Content: json['Content'],
        Created: DateTime.parse(json['Created']),
        Updated: json['Updated'] == null ? null : DateTime.parse(json['Updated']),
        Done: json['Done'] == 1
    );

    return todo;
  }
}