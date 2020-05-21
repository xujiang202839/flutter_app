import 'package:flutter/material.dart';
import 'package:flutter_app/pages/phone_page.dart';
import 'package:flutter_app/provides/IndexProvide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'client_page.dart';
import 'home_page.dart';
import 'mine_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<Widget> _pages;
  List<BottomNavigationBarItem> _bottomTabs;

  @override
  void initState() {
    super.initState();
    _pages = [ClientPage(), MinePage(), PhonePage(), HomePage()];
    _bottomTabs = List()
      ..add(_buildBottomNavItem("icon_main_page_selected.png",
          "icon_main_page_un_selected.png", "首页"))
      ..add(_buildBottomNavItem(
          "icon_client_select.png", "icon_client_un_selected.png", "客户"))
      ..add(_buildBottomNavItem(
          "icon_phone_selected.png", "icon_phone_un_selected.png", "电话簿"))
      ..add(_buildBottomNavItem(
          "icon_mine_selected.png", "icon_mine_un_selected.png", "我的"));

    //界面初始化完成
    /*WidgetsBinding.instance.addPostFrameCallback((_) {

    });*/
  }

  BottomNavigationBarItem _buildBottomNavItem(
      String icon, String activeIcon, String name) {
    double height = 28.0, width = 28.0;
    return BottomNavigationBarItem(
        icon: Image.asset("assets/images/$activeIcon",
            height: height, width: width),
        activeIcon:
            Image.asset("assets/images/$icon", height: height, width: width),
        title: Text(name));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 720, height: 1280);
    return Consumer<IndexProvide>(
      //优化：在状态改变时viewpage子页面不会走build方法
        child: PageView(
          physics: NeverScrollableScrollPhysics(), //禁止滚动
          //获取pageController后不监听改变
          controller: Provider.of<IndexProvide>(context, listen: false).pageController,
          children: _pages,
        ),
        builder: (context, indexProvide, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                if (indexProvide.currentIndex != index)
                  indexProvide.index = index;
              },
              fixedColor: Color(0xFF129BB4),
              type: BottomNavigationBarType.fixed,
              currentIndex: indexProvide.currentIndex,
              items: _bottomTabs,
            ),
          );
        });
  }
}
