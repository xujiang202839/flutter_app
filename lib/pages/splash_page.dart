import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/route/application.dart';
import 'package:flutter_app/route/route.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer time;

  @override
  void initState() {
    /**
     * 延迟1秒
     */
    time = Timer(Duration(seconds: 1), () {
      AppRouter.navigateTo(context, Routes.index,
          replace: true, transition: TransitionType.fadeIn);
    });
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/images/splash_bg.png'), fit: BoxFit.fitHeight)),
    );
  }
}
