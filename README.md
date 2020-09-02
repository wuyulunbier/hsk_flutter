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
        - [flutter-go](https://github.com/alibaba/flutter-go)
        - [flutter中文网](https://flutterchina.club)
        - [flutter官网](https://flutter.dev/docs/get-started/install)
        - [dart练习](https://www.tutorialspoint.com/execute_dart_online.php)


 - 目标
  - 1  导航栏的实现
  - 2  tabbar的实现
  - 3  刷新组件的使用
  - 4  滚动组件的使用

  - 本地图片的加载

### 常用组件
  - 容器组件 和 可视组件 Container  Row Column 
    - 1 - 滚动型容器组件 ListView()
    - 2 - 网格型布局 - GridView篇
    - 3 - 下拉刷新的实现 上拉加载的实现


## 组件的生命周期
   - 1 初始化
   - 2 状态变化
   - 3 移除组件

## flutter渲染原理
    

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
 
## 常用控件
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
        List <Widget> 默认构造函数采用子类的显式。此构造函数适用于具有少量子项的列表视图，因为构造List需要为可能在列表视图中显示的每个子项执行工作，而不仅仅是那些实际可见的子项。

        ListView.builder  它构造函数采用IndexedWidgetBuilder它根据需要构建子项。此构造函数适用于具有大量（或无限）子项数的列表视图，因为仅为实际可见的子项调用构建器。

        ListView.separated  它的构造函数有两个IndexedWidgetBuilder 构建器： itemBuilder根据需要构建子项，separatorBuilder 类似地构建出现在子项之间的分隔子项。此构造函数适用于具有固定数量子项的列表视图。
        
        ListView.custom 构造需要SliverChildDelegate提供自定义子项的其他方面的能力。例如，SliverChildDelegate可以控制用于估计实际上不可见的子项大小的算法。
        

    - SingleChildScrollView
    - Row
    - Column
    - Stack
    - Table

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
   - 订单中心  使用listview 加载订单 使用刷新组件 上拉加载组件 网络请求   gradview
   - 找车首页  使用gradview 展示常见功能  轮播图的实现
   - 个人中心 使用listView 加载常用模块
   - 登录模块 - 调用接口 实现登录功能 常见控件的封装  路由跳转



  - 网络请求的封装 json的转换
  - 路由的使用 flutter_fluro
  - 刷新 加载控件的使用 数据的拼接
  



完成目标  

#### dio 处理网络请求
   - Get和Post请求的实现
   - 拦截器的实现
   - json的数据解析 
   - 文件的上传和下载
   - 
#### http.dart的了解和使用 post和get
   - flutter自带的网络请求库

#### json转model

 - 1 手动转化

### example 
    {
        "icon": "http://www.devio.org/io/flutter_app/img/ln_food.png",
        "title": "美食林",
        "url": "https://m.ctrip.com/webapp/you/foods/address.html?new=1&ishideheader=true",
        "statusBarColor": "19A0F0",
        "hideAppBar": true
    }
       解析:
       Map<String,dynamic> map = JSON.decode(jsonStr);
       将Map转换成model

       class CommonModel {
          final String icon;
          final String title;
          final String url;
          final String statusBarColor;
          final bool hideAppBar;

           CommonModel({this.icon, this.title, this.url, this.statusBarColor,
                 this.hideAppBar});

            factory CommonModel.fromJson(Map<String, dynamic> json){//通过CommonModel.fromJson 构造函数 map构造出一个 通过CommonModel实例
               return CommonModel(
                   icon: json['icon'],
                   title: json['title'],
                   url: json['url'],
                   statusBarColor: json['statusBarColor'],
                   hideAppBar: json['hideAppBar']);
          }

       }
    

 - 2 json_serializable
  - json_serializable是dart官方推荐和提供的JSON转Model的方式
  - [JSON和序列化](https://flutterchina.club/json/)
  - 一个自动化源代码生成器来为你生成 JSON 序列化数据模
    - 1 添加第三方库和依赖
    - 2 创建model和自动化配置@JsonSerializable() part 'peesonModel.g.dart'
    - 3 生成Json解析文件 flutter packages pub run build_runner build 或者 flutter pub run build_runner watch
    - 4 重新构建model类
    - 5 业务场景的使用 json转成Map, Json 转 Model ，Model转成Map

### example
     {
    "url":"xxx",
    "tabs":[
        {
            "labelName":"推荐",
            "groupChannelCode":"tourphoto_global1"
        },
        {
            "labelName":"拍照技巧",
            "groupChannelCode":"tab—photo"
        }
     ]
    }      
   
    手动序列化JSON：比较麻烦，效率低，但新手还是多做尝试和了解比较好。
    json_serializable：效率高，watch很好用。
    工具网站：效率高，更多功能可选。


#### fluro 处理路由跳转
  - 路由跳转传值
  - 路由的全局配置

#### flutter的状态管理(待学习)
  - Redux和Provider
  - Provider是官方推荐的状态管理框架[Provider](https://pub.dev/packages/provider)
  -  Provider  ListenableProvider  ChangeNotifierProvider ValueListenableProvider StreamProvider FutureProvider
     - 在项目的 pubspec.yml 添加 provider
     - 构建混合ChangeNotifier的类，操作全局数据，使用notifyListeners方法来通知 UI 更新
     - ChangeNotifierProvider 方法将数据注册到整个应用
     - 使用 provider 的数据首先要导入 provider 以及对应的currentIndex CurrentIndexProvide，然后用 Consumer 加类型 CurrentIndexProvide 来使用这个

     -  添加Provider依赖
     -  创建Model 混入ChangeNotifier 写一个增加的方法，然后需要调用notifyListeners();这个方法是通知用到Counter对象的widget刷新用的 get方法
     -  使用ChangeNotifierProvider 管理多个对象可以用MultiProvider
     -  使用Provider获取Counter的值

- provider的使用步骤
  - ValueListenableProvider.value()，ValueListenableProvider()数据的监听
  - //此方法将从BuildContext关联的小部件树中查找，它将返回找到的最近的类型变量T
                Provider.of<T> ( BuildContext context,
                   {bool listen = true}//listen：默认true监听状态变化，false为不监听状态改变
              )
                   //也可以使用Consumer组件获取，Consumer可用在没有context的地方，还可以优化性能
                 Consumer<T>({
                @required this.builder,//这边写布局
                   this.child,//可以控制刷新性能优化，当数据数据发生改变，不会重新build，
                })

### 状态管理 streamBuild
       StreamBuild从字面意思来讲是数据流构建，是一种基于数据流的订阅管理  

 


### CustomScrollView
   - sliverAppBar
   - SliverList 
   - SliverGrid
   - SliverPadding 
   - SliverToBoxAdapter 这个是设置普通的控件，例如区头等 这个位置是不固定的随意的，
   - SliverPersistentHeader 设置头部的，任意位置，比如头部搜索框 等，
   - SliverFillRemaining SliverFillRemaining
   - SliverFillViewport


### 文件管理
   - PathProvider 提供了一种平台透明的方式来访问设备文件系统上的常用位置[PathProvider](https://pub.dev/packages/path_provider)
   - 临时目录  getTemporaryDirectory()  在iOS上，这对应于NSTemporaryDirectory() 返回的值。在Android上，这是getCacheDir())返回的值
   - 文档目录 getApplicationDocumentsDirectory() 在iOS上，这对应于NSDocumentDirectory。在Android上，这是AppData目录
   - 外部存储目录 getExternalStorageDirectory()  iOS下调用该方法会抛出UnsupportedError异常，而在Android下结果是android SDK中getExternalStorageDirectory的返回值

### 数据存储
   - shared_preferences
   - Sqflite [sqflite](https://pub.dev/packages/sqflite#-readme-tab-) 相当于sqlite
   - sqflite支持插入/查询/更新/删除
   - sqflite支持在iOS和Android上的后台线程中执行数据库操作
   - 面向对象(获取数据库对象，打开 操作 关闭) 操作数据库

 ### flutter 文件与库的引用导出
   -   定义库的名字 ibrary global;
   -   文件中引用的公共包 import 'dart:convert
   -   组成这个库的其他文件 part './model/User.dart'; part部分一定要在import部分的后面
   -   子文件的组织方式如下 part of global; 定义其他内容
   -   延迟加载或者异步加载 使用deferred as  使用时 调用loadLibrary()来加载对应的内容
                     
    
   

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
 
     - dart flutter 文件与库的引用导出
       -   定义库的名字 ibrary global;
       -   文件中引用的公共包 import 'dart:convert
       -   组成这个库的其他文件 part './model/User.dart'; part部分一定要在import部分的后面
       -   子文件的组织方式如下 part of global; 定义其他内容
       -   延迟加载或者异步加载 使用deferred as  使用时 调用loadLibrary()来加载对应的内容


  ### 打包
    - 1 android  在gradle中配置签名 构建release版本 通过flutter build apk生成   
    - 2 iOS 配置相关证书 生成ipa文件
    - 3 发布应用市场+


  ### flutter与原生开发的交互
    -  

    ### 项目的实现
     - 实现角色的选择 注册与登录基本布局  网络请求 json转model 本地数据存储  provide状态管理 路由管理 自定义导航栏
     - 首页customscrollview布局  和 复杂的自定义布局
     - 实现首页排版  customscrollview
     - 实现排期  下拉刷新  上拉加载  基本cell布局  加载提示 弹框的封装  json与model的转换 库的管理
     - 实现个人中心 网页查看 退出登录 表单提交  相册和拍照功能  清理缓存  检查更新  常用组件的封装
     

     - 网络请求 模型转换  刷新组件的封装  provide的复杂实现
     - 调用相册和相机的实现
     -


      ### 基本掌握
        Swiper：掌握Swiper插件轮播组件的用法
        Fluro：掌握企业级路由Fluro的配置及使用方法
        ScreenUtils:解决不同屏幕适配的问题
        EasyRefresh:学习并掌握移动开发中上拉加载刷新数据的方法
        SharedPreferences:通过SharedPreferences的API使用，掌握本地存储的方法
        Provide:使用Provide来管理Flutter应用的状态，使得程序结构更加清晰
        Dio:学习Dio网络请求及返回操作
        Json:学习Json格式处理,Json编解码及转换成模型的处理方法 


      ### 问题
      - 键盘弹起对布局的影响
          1 设置Scaffold的属性resizeToAvoidBottomPadding为false,
          2 Scaffold的body包裹一个ListView（就是让这个视图具有弹性效果）, 把原本的Column放到ListView的   children里面 如果不想让body具有滚动效果可以设置ScrollPhysics属性
      
      - iOS端在长按Textfield唤起粘贴复制的时候会报错。
        1 配置中英文  

      - iOS可以执行命令`flutter build ios` 以创建`release`版本。
      - Android可以执行命令`flutter build apk` 以创建`release`版本。

      - SafeArea 适配问题

      - flutter_keyboard_actions  无法关闭键盘的问题