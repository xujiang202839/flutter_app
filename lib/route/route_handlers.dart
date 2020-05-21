import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index_page.dart';
import 'package:flutter_app/pages/splash_page.dart';

var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new SplashPage();
});

var indexHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      //var data = params['id'][0];
  return new IndexPage();  //返回的是IndexPage这个Widget
});
