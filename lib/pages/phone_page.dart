

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:flutter_app/widget/CustomExpansionTile.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> with ScreenUtil,  AutomaticKeepAliveClientMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //生成一组测试数据
    final list = List.generate(5, (i) => "这是第$i个item数据");

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('电话簿', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: setW(30)),
            child: Image.asset('assets/images/icon_to_message.png',
                width: setW(40), height: setH(40)),
          )

        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          //build的item为header的内容
          itemBuilder: (context, index) {
            return CustomExpansionTile(
              backgroundColor: Colors.white24,
              initiallyExpanded: false,
              title: Container(
                  child: Text("这是第$index个",
                      style: TextStyle(color: Color(0xFF999999)))),

              //children: list.map((f) => ListTile(title: Text(f,style: TextStyle(color: Colors.blue),))).toList(),
              children: [
                ListTile(
                  title: Text("ListTile"),
                  leading: Icon(Icons.favorite_border,color: Colors.red,),
                ),
                ListTile(
                  title: Text("ListTile"),
                  leading: Icon(Icons.favorite,color: Colors.red,),
                ),
              ],
            );
          },
          itemCount: 5,
        ),
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
