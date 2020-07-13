import 'package:flutter/material.dart';

class ColorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 80,
          child: new Text("listView"),
        ),
        Container(
          color: Colors.indigo,
          height: 50,
        ),
        Container(
          color: Colors.lime,
          height: 50,
        ),
        Container(
          color: Colors.purple,
          height: 80,
        ),
        Container(
          color: Colors.green,
          height: 90,
        ),
        Container(
          color: Colors.pink,
          height: 120,
        ),
        Container(color: Colors.cyan),
        Container(
          color: Colors.amber,
          height: 60,
          child: new Text(
            "listview",
          ),
        ),
        Container(color: Colors.redAccent),
        Container(color: Colors.teal),
        Container(color: Colors.orange),
        Container(color: Colors.brown),
      ],
    );
  }
}
