# hsk_flutter

A new Flutter project.just for learning

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

// --  1. dart 基本语法的掌握
// --  2. flutter 基本组件的掌握
// --  3. apk和ipa包的生成和发布


1  常见框架的使用
   1 网络请求的封装  dio
   2 本地数据的存储  shared_preferences
   3 常见弹框       fluttertoast
   4 状态管理       flutter_redux 
   5 


注意点：StatelessWidget和StatefulWidget是flutter的基础组件，日常开发中自定义Widget都是选择继承这两者之一
两者的区别在于状态的改变，StatelessWidget面向那些始终不变的UI控件，比如标题栏中的标题；而StatefulWidget则是面向可能会改变UI状态的控件，比如有点击反馈的按钮

1 - 组件之间的通信
    * 父子组件通信        * 兄弟组件通信 


2 - 原生和混合的交互   

3 - 加载图片的相对路径
     1 pubspec.yaml中配置图片
     2 使用 key 从AssetBundle获得的图片·
     3 加载网络图片




//目标
  1  导航栏的实现
  2  tabbar的实现
  3  刷新组件的使用
  4  滚动组件的使用

  //本地图片的加载


  //容器组件 和 可视组件
    1 - 滚动型容器组件 ListView()
    2 - 网格型布局 - GridView篇


//常用属性
 GridView({
  Key key,
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  ScrollPhysics physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry padding,
  @required this.gridDelegate,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
})

ListView({
  Axis scrollDirection = Axis.vertical,
  ScrollController controller,
  ScrollPhysics physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry padding,
  this.itemExtent,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
})
        


  
  //编译和打包
    Android
    ios
