import 'dart:developer';

import 'package:flutter/material.dart';

import '../Customer.dart';

class SecondPage extends StatelessWidget {

  final Todo todo;
  final con = TextEditingController();

  SecondPage(this.todo);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(todo.Title)),
      body: new Center(
        child: new ListView(
          children: <Widget>[
            Text('From: ${todo.Username}'),
            Text('Content: ${todo.Content}'),
            Text('Created: ${todo.Created}'),
            Text('Updated: ${todo.Updated != null ? todo.Updated.toString() : "never"}'),
            Text('Is Done?:  ${todo.Done ? "True" : "False"}'),
            FlatButton(
              child: Text("Foo"),
              onPressed: () {
                SecondPage(this.todo);
              },
            )
          ],
        )
      ),
    );
  }
}
