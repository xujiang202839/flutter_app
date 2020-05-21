import 'package:flutter/material.dart' show ChangeNotifier, PageController;

class IndexProvide with ChangeNotifier {
  int _currentIndex = 0;

  PageController pageController;

  int get currentIndex => _currentIndex;

  set index(int value) {
    _currentIndex = value;
    pageController.jumpToPage(this._currentIndex);
    notifyListeners();
  }

  IndexProvide() {
    pageController = PageController(initialPage: _currentIndex);
  }

  //使用ChangeNotifierProvider会在销毁时调用dispose()方法释放资源
  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }
}
