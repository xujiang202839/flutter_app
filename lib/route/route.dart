import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index_page.dart';
import 'package:flutter_app/route/route_handlers.dart';

class Routes {
  static String root = '/';//根目录
  static String index = '/index';//index路由path

  //设置路由
  static void configureRoutes(Router router) {
    //定义未找到页面
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("RΩOUTE WAS NOT FOUND !!!");
      return IndexPage();
    });

    router.define(root, handler: splashHandler);
    router.define(index, handler: indexHandler);//定义index路由
  }
}
