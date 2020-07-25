import 'dart:developer';

import 'package:flutter/material.dart';

import '../Customer.dart';

class SecondPage extends StatefulWidget {
  final int Id;
  final String Title;
  const SecondPage ({Key key, this.Id, this.Title}): super(key: key);

  @override
  State<StatefulWidget> createState() => new _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Future<Todo> futureTodo;

  @override
  void initState() {
    super.initState();
    futureTodo = fetchTodo(widget.Id);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.Title}")),
      body: new Center(
        child: FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.hasData) {
              Todo todo = projectSnap.data;
                  return ListView(
                    children: <Widget>[
                      Text('From: ${todo.Username}'),
                      Text('Content: ${todo.Content}'),
                      Text('Created: ${todo.Created}'),
                      Text('Updated: ${todo.Updated != null ? todo.Updated.toString() : "never"}'),
                      Text('Is Done?:  ${todo.Done ? "True" : "False"}'),
                    ],
                  );
                }
              return CircularProgressIndicator();
            },
            future: futureTodo,
    ),
        ),
    );
  }
}

  /*final Todo todo;
  final con = TextEditingController();

  SecondPage(this.todo);*/

