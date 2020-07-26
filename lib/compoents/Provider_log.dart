/**
 * Provider()与Provider.value()区别是Provider()有一个dispose参数传递一个方法可以帮助我们销毁的时候释放资源，它们都不提供状态改变监听。
   ValueListenableProvider.value()与ValueListenableProvider()是差不多的，只支持一个状态值。
  ChangeNotifierProvider.value()与ChangeNotifierProvider()区别是ChangeNotifierProvider()在销毁的时候调用dispose()释放资源，在需要使用多个状态值时可以使用ChangeNotifierProvider。
  ListenableProvider代码没有写出来，它是ChangeNotifierProvider的父类，
ListenableProvider.value()和ChangeNotifierProvider.value()功能一样，ListenableProvider()与ValueListenableProvider()差不多，但ListenableProvider()多了一个dispose参数，需要自己传，在销毁的时候调用释放资源.
StreamProvider.value()和StreamProvider()基本一样，都需要手动关闭流，而StreamProvider.controller()自动关闭流。
MultiProvider()可以提供多个状态。
Provider.of<T>()用来获取Widget树中的状态，在使用 ValueListenableProvider、ChangeNotifierProvider和StreamProvider时Provider.of<T>()中的listen参数可以控制是否监听状态改变。
Consumer<T>()与Provider.of<T>()都是用来获取Widget树中的状态，但Consumer可以用在没有context的地方，也可以用来优化性能，使用child参数可以缩小重绘的范围。
状态管理包裹在MaterialApp()外面作用域是全局，其他作用域在本页面或本页的子Widget中；
 */
