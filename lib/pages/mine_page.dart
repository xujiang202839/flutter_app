import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/phone_page.dart';
import 'package:flutter_app/utils/screen_util.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with
        ScreenUtil,
        AutomaticKeepAliveClientMixin,
        SingleTickerProviderStateMixin {
  TabController _tabController;
  var _tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    _tabs = <Tab>[
      Tab(text: '待付款'),
      Tab(text: '待收货'),
    ];
    _tabController = TabController(
        length: _tabs.length, vsync: this, initialIndex: int.parse('0'));
  }

  /*int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Container(
          width: setW(380),
          child: TabBar(
            tabs: _tabs,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: false,
            indicatorColor: Colors.blue,
            indicatorWeight: setW(4),
            indicatorPadding: EdgeInsets.all(0),
           // labelPadding: EdgeInsets.only(left: setW(40), right: setW(40)),
            labelColor: Colors.black,
            labelStyle: TextStyle(
                color: Color(0xff333333),
                fontSize: setSp(32),
                fontWeight: FontWeight.bold),
            unselectedLabelColor: Color(0xFF999999),
            unselectedLabelStyle:
            TextStyle(color: Color(0xFF999999), fontSize: setSp(32)),
          ),
        ),
        actions: <Widget>[
          Icon(Icons.add,color: Colors.black,size: setW(56),)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          PhonePage(),
        ],
      ),
      /*Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: RadioListTile(
              value: 0,
              title: Text("待审批",
                  style: TextStyle(
                      color: _radioGroupA == 0 ? Colors.red : Colors.black)),
              groupValue: _radioGroupA, //权组值
              onChanged: _handleRadioValueChanged,
            )),
            Flexible(
                child: RadioListTile(
              value: 1,
              secondary: null,
              title: Text("待审批",
                  style: TextStyle(
                      color: _radioGroupA == 1 ? Colors.red : Colors.black)),
              groupValue: _radioGroupA,
              //权组值
              onChanged: _handleRadioValueChanged,
            ))
          ],
        ),
      ),*/
    );
  }

  @override
  bool get wantKeepAlive => true;
}
