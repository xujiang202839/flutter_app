import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen_util.dart';

class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> with ScreenUtil ,  AutomaticKeepAliveClientMixin{
  List<IconData> _icons = []; //保存Icon数据
  List<String> _itemData = ['新客登记', '预约看房', '预定房间']; //保存Icon数据
  List<String> _itemTitle = ['房源查看', '排班查看', '请假', '考勤打卡']; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0,
        title: Text("首页",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: setW(30)),
            child: Image.asset('assets/images/icon_to_message.png',
                width: setW(40), height: setH(40)),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: setW(30), top: setH(30), right: setW(30)),
              child: Image.asset('assets/images/icon_main_page_banner.png',
                  width: double.infinity, fit: BoxFit.fitWidth),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: setW(30), top: setH(30)),
            child: Text(
              '待办事项',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0, //显示区域宽高相等
              //crossAxisSpacing: setW(10),
              //mainAxisSpacing: setH(10)
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/icon_main_page_leave.png',
                          width: setW(80), height: setH(80)),
                      Container(
                        margin: EdgeInsets.only(top: setH(15)),
                        child: Text(_itemData[index]),
                      )
                    ],
                  ),
                );
              },
              childCount: _itemData.length,
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: setW(30), bottom: setH(30)),
            child: Text(
              '工作管理',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0, //显示区域宽高相等
              //crossAxisSpacing: setW(10),
              //mainAxisSpacing: setH(10)
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/icon_main_page_leave.png',
                          width: setW(80), height: setH(80)),
                      Container(
                        margin: EdgeInsets.only(top: setH(15)),
                        child: Text(_itemTitle[index]),
                      )
                    ],
                  ),
                );
              },
              childCount: _itemTitle?.length,
            ),
          )
          /*GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //每行三列
                    childAspectRatio: 1.0, //显示区域宽高相等
                    crossAxisSpacing: setW(10),
                    mainAxisSpacing: setH(10)),
                itemCount: _icons.length,
                itemBuilder: (context, index) {
                  //如果显示到最后一个并且Icon总数小于200时继续获取数据
                  return Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/icon_main_page_leave.png',
                            width: setW(80), height: setH(80)),
                        Container(
                          margin: EdgeInsets.only(top: setH(15)),
                          child: Text("管家"),
                        )
                      ],
                    ),
                  );
                }),*/
        ],
      ),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    _icons.addAll([
      Icons.ac_unit,
      Icons.airport_shuttle,
      Icons.all_inclusive,
      Icons.beach_access,
      Icons.cake,
      Icons.free_breakfast
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
