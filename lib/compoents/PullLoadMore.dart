import 'package:flutter/material.dart';
import 'NewsCard.dart';

/**
 * 上拉加载组件
 */

class PullUpLoadMoreList extends StatefulWidget {
  const PullUpLoadMoreList({Key key}) : super(key: key);

  @override
  _PullUpLoadMoreListState createState() => _PullUpLoadMoreListState();
}

class _PullUpLoadMoreListState extends State<PullUpLoadMoreList> {
  bool isLoading = false;
  ScrollController scrollController = ScrollController();
  List<NewsViewModel> list = [
    NewsViewModel(
      title: '中方将派军舰赴马六甲海峡护航本国船只？外交部：那是谣言',
      source: '环球网',
      comments: 71,
      coverImgUrl: 'https://p3.pstatp.com/list/190x124/pgc-image/RGSD09itseweQ',
    ),
    NewsViewModel(
      title: '211高校被误认野鸡大学发怒，名气还没“野鸡”大',
      source: '中国新闻周刊',
      comments: 980,
      coverImgUrl:
          'https://p1.pstatp.com/list/190x124/pgc-image/7026a3edfe2b47f59eea94f2b8cd86a4',
    ),
    NewsViewModel(
      title: '广西矿王黎东明去世：瞒报81死矿难，把记者逼到悬崖边，遭售货员白眼后买下整柜台皮鞋',
      source: '大河看法',
      comments: 2759,
      coverImgUrl:
          'https://p1.pstatp.com/list/190x124/pgc-image/c14366a3b7ab4a3384e3485697d103fe',
    ),
    NewsViewModel(
      title: '六旬父亲“为儿追凶”16年：“赔多少钱都不要，就要他偿命”',
      source: '中国新闻周刊',
      comments: 20645,
      coverImgUrl:
          'https://p3.pstatp.com/list/190x124/pgc-image/c55f17d3a3ac4efe8eaedafdab111079',
    ),
    NewsViewModel(
      title: '五问玛莎拉蒂追尾案：肇事女孩有何背景？或面临死刑？',
      source: '环球网',
      comments: 2121,
      coverImgUrl:
          'https://p1.pstatp.com/list/190x124/pgc-image/RVi866A4f9cVK2',
    ),
  ];

  @override
  void initState() {
    super.initState();
    this.scrollController.addListener(() {
      if (!this.isLoading &&
          this.scrollController.position.pixels >=
              this.scrollController.position.maxScrollExtent) {
        setState(() {
          this.isLoading = true;
          this.loadMoreData();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.scrollController.dispose();
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        List<NewsViewModel> list1 = [
          NewsViewModel(
            title: '中方将派军舰赴马六甲海峡护航本国船只？外交部：那是谣言',
            source: '环球网',
            comments: 71,
            coverImgUrl:
                'https://p3.pstatp.com/list/190x124/pgc-image/RGSD09itseweQ',
          ),
          NewsViewModel(
            title: '211高校被误认野鸡大学发怒，名气还没“野鸡”大',
            source: '中国新闻周刊',
            comments: 980,
            coverImgUrl:
                'https://p1.pstatp.com/list/190x124/pgc-image/7026a3edfe2b47f59eea94f2b8cd86a4',
          ),
        ];
        this.isLoading = false;

        this.list.addAll(list1); //拼接数据
      });
    });
  }

  Widget renderBottom() {
    if (this.isLoading) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '努力加载中...',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF333333),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 3),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        child: Text(
          '上拉加载更多',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF333333),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: this.scrollController,
      itemCount: this.list.length + 1,
      separatorBuilder: (context, index) {
        return Divider(height: .5, color: Color(0xFFDDDDDD));
      },
      itemBuilder: (context, index) {
        if (index < this.list.length) {
          return NewsCard(data: this.list[index]);
        } else {
          return this.renderBottom();
        }
      },
    );
  }
}
