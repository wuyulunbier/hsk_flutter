import 'package:flutter/material.dart';

class NotifySetPage extends StatefulWidget {
  NotifySetPageState createState() => NotifySetPageState();
}

/**
 * flex 布局
 */
class NotifySetPageState extends State<NotifySetPage> {
  Widget redDivider = new Divider(
    color: Colors.black,
    indent: 20,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('推送设置'),
      ),
      body: Padding(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                      child: Text(
                        '你好啊',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 150,
                      decoration: BoxDecoration(color: Colors.black),
                    ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 150,
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Container(
                              decoration: BoxDecoration(color: Colors.yellow))),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration:
                                        BoxDecoration(color: Colors.orange),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 160,
                  color: Colors.amberAccent,
                  child: GridView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // mainAxisSpacing: 10.0,
                      // crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      //Widget Function(BuildContext context, int index)
                      return Card(
                        elevation: 5.0, //设置阴影
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Text('${index}'),
                        ),
                        color: Colors.red,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(5),
                  color: Colors.green,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 800,
                  color: Colors.black38,
                  child: ListView.separated(
                      //scrollDirection: d,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: new Text(
                          "i am list index $index",
                          style:
                              new TextStyle(fontSize: 24, color: Colors.blue),
                        ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return redDivider;
                      },
                      itemCount: 55),
                )
              ],
            ),
          )),
    );
  }
}
