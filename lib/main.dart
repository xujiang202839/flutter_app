import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/blocs/application_bloc.dart';
import 'package:flutter_app/blocs/bloc_provider.dart';
import 'package:flutter_app/pages/index_page.dart';
import 'package:flutter_app/provides/IndexProvide.dart';
import 'package:flutter_app/route/application.dart';
import 'package:flutter_app/route/route.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      //MultiProvider可以添加多个状态管理
      //包裹在MaterialApp外面，作用范围是全局
      MultiProvider(
    providers: [
      //两种方式，这里使用ChangeNotifierProvider，因为可以自动调用dispose()方法，帮我释放资源
      //ChangeNotifierProvider(create: (BuildContext context){} ),
      ChangeNotifierProvider.value(value: IndexProvide())
    ],
    child: MyApp(),
  ));

  //强制竖屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //如果是Android 设置状态栏颜色
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //初始化路由
    final router = new Router();
    Routes.configureRoutes(router);
    AppRouter.router = router;

    return BlocProvider(
      bloc: Application(),
      child: MaterialApp(
        title: '宽庭助手',
        onGenerateRoute: AppRouter.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          splashColor: Colors.transparent,
            appBarTheme: AppBarTheme(elevation: 1.5),
            primaryColor: Colors.blue,
            primarySwatch: Colors.pink),
      ),
    );
  }
}
/*class MyAppState extends State<MyApp> {
  MyAppState() {
    //初始化路由
    final router = new Router();
    Routes.configureRoutes(router);
    AppRouter.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: Application(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "租客管家",
          theme: ThemeData(
              appBarTheme: AppBarTheme(elevation: 1.5),
              primaryColor: Colors.blue),
          onGenerateRoute: AppRouter.router.generator,
        ));
  }
}*/
