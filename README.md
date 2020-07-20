iq# hsk_flutter

A new Flutter project.just for learning

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

-  --  1. dart 基本语法的掌握
-  --  2. flutter 基本组件的掌握
-  --  3. apk和ipa包的生成和发布


### 项目运行环境
    1. Flutter version 1.17.5
    2. Dart version 2.8.4


### 常见框架的使用
   - 网络请求的封装  dio
   - 本地数据的存储  shared_preferences
   - 常见弹框       fluttertoast
   - 状态管理       flutter_redux 
   - 滚动图         flutter_swiper
   - 路由跳转       flutter_fluro

### 注意点：
     StatelessWidget和StatefulWidget是flutter的基础组件，日常开发中自定义Widget都是选择继承这两者之一
     两者的区别在于状态的改变，StatelessWidget面向那些始终不变的UI控件，比如标题栏中的标题；
     StatefulWidget则是面向可能会改变UI状态的控件，比如有点击反馈的按钮

- 1 - 组件之间的通信
    * 父子组件通信        
    * 兄弟组件通信 


- 2 - 原生和混合的交互   

- 3 - 加载图片的相对路径
    - 1 pubspec.yaml中配置图片
    - 2 使用 key 从AssetBundle获得的图片·
    - 3 加载网络图片
        - [flutter-go]（https://github.com/alibaba/flutter-go）
        - [flutter中文网]（https://flutterchina.club）
        - [flutter官网]（https://flutter.dev/docs/get-started/install）
        - [dart练习] （https://www.tutorialspoint.com/execute_dart_online.php）


//目标
  - 1  导航栏的实现
  - 2  tabbar的实现
  - 3  刷新组件的使用
  - 4  滚动组件的使用

  //本地图片的加载

### 常用组件
  - //容器组件 和 可视组件 Container  Row Column 
    - 1 - 滚动型容器组件 ListView()
    - 2 - 网格型布局 - GridView篇
    - 3 - 下拉刷新的实现
    - 4 - 


## 组件的生命周期
   - 1 初始化
   - 2 状态变化
   - 3 移除组件

## Flutter手势的学习
   - onTapDown: (details) {},
   - onTapUp: (details) {},
   - onTap: () {},
   - onTapCancel: () {},   
   
   - onDoubleTap: () {},
   - onLongPress: () {},
   - onLongPressStart: () {},
   - onLongPressMoveUpdate: () {},
   - onLongPressUp: () {},
   - onLongPressEnd: () {},
 
//常用属性
- GridView({
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

- ListView({
  Axis scrollDirection = Axis.vertical,
  ScrollController controller,
  ScrollPhysics physics,
  bool shrinkWrap = false,
  EdgeInsetsGeometry padding,
  this.itemExtent,
  double cacheExtent,
  List<Widget> children = const <Widget>[],
})

### 自定义组件
  -  Flutter框架给我们提供了StatelessWidget和StatefulWidget两个抽象类，用于自定义控件
  -  StatelessWidget是‘‘无状态控件’’,不可变状态控件,通过构建其他控件来描述用户界面的一部分。必须实现build方法，返回一个widget对象。 Icon、 IconButton, 和Text等都是无状态widget, 他们都是 StatelessWidget的子类
  -   StatefulWidget 是动态的. 用户可以和其交互 (例如输入一个表单、 或者移动一个slider滑块),或者可以随时间改变 (也许是数据改变导致的UI更新).Checkbox, Radio, Slider, Form, 和TextField 都是 stateful widgets, 他们都是 StatefulWidget的子类

  -  自定义Widget：继承StatefulWidget，并重写createState()方法，返回一个State对象。自定义无状态的widget
  -  组件的隐藏和显示


控件的包含采用child来装载
flutter常用控件示例

  
 ### 编译和打包
    Android
    ios



#### 该项目的主要实现
   - 订单中心  使用listview 加载订单   使用刷新组件   网络请求   gradview
   - 找车首页  使用gradview 展示常见功能  轮播图的实现
   - 个人中心 使用listView 加载常用模块
   - 登录模块 - 调用接口 实现登录功能 常见控件的封装  路由跳转



  - 网络请求的封装 json的转换
  - 路由的使用 flutter_fluro
  - 刷新 加载控件的使用
  



完成目标  

#### dio 处理网络请求
   - Get和Post请求的实现
   - 拦截器的实现
   - json的数据解析 
   - 文件的上传和下载
   - 
#### http.dart的了解和使用 post和get
   - flutter自带的网络请求库
   


#### fluro 处理路由跳转
  - 路由跳转传值
  - 路由的全局配置

#### flutter的状态管理
  - Redux和Provider
  - Provider是官方推荐的状态管理框架
  -  Provider  ListenableProvider  ChangeNotifierProvider ValueListenableProvider StreamProvider FutureProvider

#### 登录功能界面

### dart基本语法
  - 基本数据类型  Number String bool List（数组） Set（集合里面的值不可以重复，值的类型必须统一。最主要的功能是去除数组中重复的内容。 Set是没有顺序且不能重复的集合） Map（无序的键值对）
  - final 和 const var 定义变量和常量
  - 字符串转数字 var one = int.parse('test')
  - 数字转字符串 var str = num.toString();
  - dart中的函数Function 
    - 3.1 自定义方法的基本格式
    返回类型 方法名称(形式参数1，形式参数2，......){
          方法体 具体执行逻辑
        return 返回值;
       }
     print();//内置方法/函数
  - 箭头函数 void main() => runApp(new MyApp());
  - dart流程控制语句 
  - dart支持泛型
  - dart类的概念 一个类通常由属相和方法组成
     子类使用extends类关键字来继承父类
     子类会集成父类中可见的属性和方法 但是不会继承构造函数
     子类能重写父类的方法getter和setter方法
  - async & await
  - Function Dart是面向对象的语言
  - 匿名函数
  - 函数作用域
  - as , is 与 is!
     - as : 判断属于某种类型
     - is : 如果对象具有指定的类型，则为true
     - is! : 如果对象具有指定的类型，则为false
 


  #打包
    1 android  在gradle中配置签名 构建release版本 通过flutter build apk生成   
    2 iOS 配置相关证书 生成ipa文件
