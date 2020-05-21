import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/provides/IndexProvide.dart';
import 'package:flutter_app/utils/screen_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenUtil,  AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: setH(300),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/images/personal_center_bg.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).padding.top + setW(20),
                  right: setW(20),
                  child: Image.asset(
                    "assets/images/icon_main_page_selected.png",
                    width: setW(30),
                  )),
              Container(
                width: double.infinity,
                height: setH(200),
                padding: EdgeInsets.only(left: setW(43)),
                margin: EdgeInsets.only(
                    top: setW(200) - (MediaQuery.of(context).padding.top) / 2,
                    left: setW(43),
                    right: setW(43)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(setW(16))),
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    InkWell(
                      onTap: ()=> Provider.of<IndexProvide>(context, listen: false).index = 1,
                      child:
                      ClipOval(child: Icon(Icons.account_circle,size: setW(100),color: Colors.red)),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: setW(16)),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("name"),
                          Text("18896917159")
                        ],
                      )
                    ),

                  ],
                ),
              )
            ],
          ),
          _addColumn(true),
          _addColumn(false),
          _addColumn(false)
        ],
      ),
    );
  }

  Widget _addColumn(bool bool) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: bool ? setH(30) : 0),
      padding: EdgeInsets.symmetric(vertical: setH(30), horizontal: setW(43)),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(right: setW(30)),
              child: Icon(Icons.account_balance_wallet,
                  size: setW(24), color: Color(0xFF999999))),
          Expanded(child: Text("data12233")),
          Icon(Icons.arrow_forward_ios,
              size: setW(24), color: Color(0xFF999999)),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
