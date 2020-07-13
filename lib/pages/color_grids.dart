import 'package:flutter/material.dart';

/**
 * 
 * 
 * GridView的使用
 */

class ColorGrids extends StatelessWidget {
  //无状态组件
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: <Widget>[
        Container(
          color: Colors.red,
          child: new Text("gridview"),
        ),
        Container(color: Colors.indigo),
        Container(color: Colors.lime),
        Container(color: Colors.purple),
        Container(color: Colors.green),
        Container(color: Colors.pink),
        Container(color: Colors.cyan),
        Container(
          color: Colors.amber,
          child: new Text("gridview"),
        ),
        Container(color: Colors.redAccent),
        Container(color: Colors.teal),
        Container(color: Colors.orange),
        Container(color: Colors.brown),
      ],
    );
  }
}
