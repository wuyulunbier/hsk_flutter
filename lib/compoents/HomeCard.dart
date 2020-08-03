import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final NewsViewModel data;

  const HomeCard({
    Key key,
    this.data,
    this.onTap,
  }) : super(key: key);

  final GestureTapCallback onTap;

  void onItemClick() {
    print('你点击了' + '条数据');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange,
        padding: EdgeInsets.all(16),
        // onTap: onTap,
        // margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        // decoration: BoxDecoration(
        //   color: Colors.red,
        //   borderRadius: BorderRadius.circular(8),
        // ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${this.data.title}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text('${this.data.source}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black45,
                        ))
                  ],
                ),
              ),
              //  Padding(padding: EdgeInsets.only(left: 16)),
              Stack(
                children: <Widget>[
                  Image.network(
                    this.data.coverImgUrl,
                    width: 80,
                    height: 60,

                    //fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class NewsViewModel {
  /// 新闻标题
  final String title;

  /// 来源
  final String source;

  /// 评论数量
  final int comments;

  /// 新闻配图
  final String coverImgUrl;

  const NewsViewModel({
    this.title,
    this.source,
    this.comments,
    this.coverImgUrl,
  });
}
