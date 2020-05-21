
import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRouter {
  //静态化Router，这样我们在使用的时候就可以直接用 AppRouter.Router就可以了。这样在任何一个页面都可以直接调用，不用再New 去调用了。
  static Router router;

  static Future navigateTo(BuildContext context, String path, {bool replace = false, bool clearStack = false,
        TransitionType transition = TransitionType.native,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionBuilder}) {
    if (Platform.isAndroid) transition = TransitionType.inFromRight;

    return router.navigateTo(context, path,
        transition: transition,//转换类型
        replace: replace,//替代，为true时调用的是Navigator.pushReplacement
        clearStack: clearStack,//清空路由栈，为true时调用的是Navigator.pushAndRemoveUntil方法
        transitionDuration: transitionDuration,//转换的持续时间
        transitionBuilder: transitionBuilder);//转换生成器
  }

  static pop(BuildContext context) {
    router.pop(context);
  }
}