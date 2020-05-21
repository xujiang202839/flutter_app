import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_util.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with ScreenUtil ,AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("客户信息"),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
