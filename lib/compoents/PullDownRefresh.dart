import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'NewsCard.dart';

class PullDownRefreshList extends StatefulWidget {
  const PullDownRefreshList({Key key}) : super(key: key);

  @override
  _PullDownRefreshListState createState() => _PullDownRefreshListState();
}

class _PullDownRefreshListState extends State<PullDownRefreshList> {
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  List list = [
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
    NewsViewModel(
      title: '李若彤：当年为爱作出任性选择，如今看来都是最好的安排',
      source: '新京报',
      comments: 243,
      coverImgUrl:
          'https://p3.pstatp.com/list/190x124/pgc-image/RVLwKBq5IQMvCW',
    ),
    NewsViewModel(
        title: '好惨一首都！“史诗级”暴雨把华盛顿淹成了……这个样子',
        source: '环球网',
        comments: 750,
        coverImgUrl:
            'https://p1.pstatp.com/list/190x124/pgc-image/RVic5NyDDeVAi0'),
    NewsViewModel(
        title: '原子弹爆炸半衰期动不动几万年，为何广岛和长崎现在就能居住了？',
        source: '怪罗科普',
        comments: 325,
        coverImgUrl:
            'https://p1.pstatp.com/list/190x124/pgc-image/317a92302937426c999ea9a5b52121b1'),
    NewsViewModel(
        title: '马超和关羽到底谁强？古书记载颠覆历史，学者：根本不是一个级别',
        source: '田君良',
        comments: 856,
        coverImgUrl:
            'https://p3.pstatp.com/list/190x124/pgc-image/470fb21c5c884b119116179813b82d2b'),
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

  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      Toast.show('当前已是最新数据', context);
    });
  }

  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        this.isLoading = false;

        this.list.addAll(list); //拼接数据
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
    return RefreshIndicator(
      onRefresh: this.onRefresh,
      child: ListView.separated(
        itemCount: this.list.length,
        itemBuilder: (context, index) {
          if (index < this.list.length) {
            return NewsCard(data: this.list[index]);
          } else {
            return this.renderBottom();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(height: .5, color: Color(0xFFDDDDDD));
        },
      ),
    );
  }
}
