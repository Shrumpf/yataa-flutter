import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helloflutter/Customer.dart';
import './secondpage.dart';

final List<String> entries = <String>["A", "B", "C"];

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Todo>> futureCustomers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCustomers = fetchCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Drawer App")),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
                title: new Text("First"),
                trailing: new Icon(Icons.accessibility),
                onTap: () {

                }
            )
          ],
        ),
      ),
      body: new Center(
        child: FutureBuilder(
          builder: (context, projectSnap) {
            if (projectSnap.hasData) {
            return ListView.builder(
              itemCount: projectSnap.data.length,
                itemBuilder: (context, index) {
              Todo todo = projectSnap.data[index];
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(todo.Title),
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => SecondPage(todo)));
                    }
                  )
                ],
              );
            });
            }
            return CircularProgressIndicator();
          },
          future: futureCustomers,
        )
          /*child: new ListView.builder(
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(child: Text("Lol ${entries[index]}")),
                );
              }
          )*/
      ),
    );
  }
}