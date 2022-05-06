
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';
import 'package:flutter/material.dart';
import 'navigator_util.dart';
import 'webview.dart';
import 'WebView_new.dart';

// 条码扫描功能
// 参考 https://blog.csdn.net/llh_llh_/article/details/120162934
class OpenMain extends StatelessWidget {
  final String phoneNumber;

  OpenMain({Key? key, required this.phoneNumber}) : super(key: key);

  IconData lightIcon = Icons.flash_on;
  final ScanController _controller = ScanController();

  void getResult(String result, BuildContext context) {
    //TODO
//    print( "getResult result="+result );
//    print( "getResult BuildContext="+context.toString() );

    Navigator.pop(context, result);
  }

  Scaffold scaffold1(){
    return Scaffold(
//      appBar: IAppBar(
//          "扫码"
//      ),
      appBar: AppBar(
        title: Text("主窗口"),
      ),
      body: Column(
        // xuky 2022.05.05 参考 https://h.lishaoy.net/flutterctrip
        // 源码地址 https://github.com/persilee/flutter_ctrip/blob/master/lib/widget/grid_nav_new.dart
        // 网格导航分为三行四栏   三行使用渐变色背景
        // 最外面放在 Column 组件
        children: <Widget>[
          Container(
            // 第一行包裹 Container 设置其渐变色
            height: 72,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                //设置渐变色
                Color(0xfffa5956),
                Color(0xffef9c76).withAlpha(45)
              ]),
            ),
            child: Row(), // 第一行
          ),
          Padding(
            padding: EdgeInsets.only(top: 1), // 设置行直接的间隔
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                //设置渐变色
                Color(0xff4b8fed),
                Color(0xff53bced),
              ]),
            ),
            child: Row(), // 第二行
          ),
          Padding(
            padding: EdgeInsets.only(top: 1), // 设置行直接的间隔
          ),
          Container(
            height: 72,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                //设置渐变色
                Color(0xff34c2aa),
                Color(0xff6cd557),
              ]),
            ),
            child: Row(), // 第三行
          ),
        ],
      ),
    );

  }
  PhysicalModel scaffold2(BuildContext context){
    return PhysicalModel(
      // PhysicalModel 组件 :​ 可以将布局显示成不同的形状
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: double.infinity,
        child: Column(
          // Column 组件能让子组件竖轴排列， Row 组件能让子组件横轴排列
          // Container 是每行的内容   Padding是行与行之间的分隔线
          children: <Widget>[
            Container(
              height: 72,
              // BoxDecoration是Widget的装饰，使其改变其显示形式
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xfffa5956),
                  Color(0xffef9c76).withAlpha(45)
                ]),
              ),
              child: Row(
                children: <Widget>[
                  // GestureDetector在Flutter中负责处理跟用户的简单手势交互
                  // 我们可以利用GestureDetector包裹本身不支持点击回调事件的Widget赋予它们点击回调能力
                  // 像Text、Image我们就不能像使用RaisedButton一样直接给Text、Image绑定onPress回调，但是我们可以借助GestureDetector完成这一操作
                  GestureDetector(
                    onTap: () {  //onTap是点击事件
                      NavigatorUtil.push(context, WebView(
//                        url: 'https://m.ctrip.com/webapp/hotel/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
//                        url: 'http://110.242.68.4/',
                        url: 'http://www.baidu.com',
                        hideAppBar: true,
                      ));
                    },
                    child: Container(
                      width: 110,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                              color: Colors.white,
                              width: 1,
                            )),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          Image.asset(
                            'images/grid_nav_items_hotel.png',
                            width: 70,
                            fit: BoxFit.contain,
                            alignment: AlignmentDirectional.bottomEnd,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              '百度',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
//                        NavigatorUtil.push(context, WebView(
//                          url: 'https://m.ctrip.com/webapp/inn-v2/home?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
//                          hideAppBar: true,
//                        ));
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return WebView_new(phoneNumber: "123");
                        }));

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Image.asset(
                              'images/grid_nav_items_minsu.png',
                              width: 32,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                'web View',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/vacations/idiytour/newindex?sourcefrom=h5_xingongge&title=%E6%9C%BA%E7%A5%A8%E3%83%BB%E7%81%AB%E8%BD%A6%E7%A5%A8%2B%E9%85%92%E5%BA%97&isHideNavBar=YES&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xffffbc49), Color(0xffffd252)]),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: <Widget>[
                            Image.asset(
                              'images/grid_nav_items_jhj.png',
                              width: 90,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomEnd,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '机票/火车票+酒店',
                                style: TextStyle(fontSize: 14, color: Color(0xffa05416)),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 24,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                decoration: BoxDecoration(
                                    color: Color(0xfff54c45),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(5),
                                    )
                                ),
                                child: Text(
                                  '方便又便宜',
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1),
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff4b8fed),
                  Color(0xff53bced),
                ]),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      NavigatorUtil.push(context, WebView(
                        url: 'https://m.ctrip.com/html5/flight/swift/index?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                        hideAppBar: false,
                        title: '机票',
                      ));
                    },
                    child: Container(
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                              color: Colors.white,
                              width: 1,
                            )),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          Image.asset(
                            'images/grid_nav_items_flight.png',
                            width: 70,
                            fit: BoxFit.contain,
                            alignment: AlignmentDirectional.bottomEnd,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              '机票',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=5661dfc9',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Image.asset(
                              'images/grid_nav_items_train.png',
                              width: 32,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '火车票',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/bus/?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '汽车·船票',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/cw/car/home/index.html',
                          hideAppBar: false,
                          title: '专车·租车',
                        ));
                      },
                      child: Container(
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '专车·租车',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1),
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xff34c2aa),
                  Color(0xff6cd557),
                ]),
              ),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      NavigatorUtil.push(context, WebView(
                        url: 'https://m.ctrip.com/webapp/vacations/tour/vacations?secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                        hideAppBar: true,
                      ));
                    },
                    child: Container(
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                              color: Colors.white,
                              width: 1,
                            )),
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: <Widget>[
                          Image.asset(
                            'images/grid_nav_items_travel.png',
                            width: 80,
                            fit: BoxFit.contain,
                            alignment: AlignmentDirectional.bottomEnd,
                          ),
                          Container(
                            alignment: AlignmentDirectional.centerStart,
                            margin: EdgeInsets.only(left: 16),
                            child: Text(
                              '旅游',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/train/crh/plan/crhList.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: false,
                          title: '高铁游',
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: <Widget>[
                            Image.asset(
                              'images/grid_nav_items_dingzhi.png',
                              width: 40,
                              fit: BoxFit.contain,
                              alignment: AlignmentDirectional.bottomStart,
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                '高铁游',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/cruise/index?ctm_ref=C_vac_cruise&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                color: Colors.white,
                                width: 1,
                              )),
                        ),
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '游轮游',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        NavigatorUtil.push(context, WebView(
                          url: 'https://m.ctrip.com/webapp/dingzhi/index?ctm_ref=C_vac_custom&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F',
                          hideAppBar: true,
                        ));
                      },
                      child: Container(
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            '定制游',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold scaffold3(BuildContext context){
    return Scaffold(
//      appBar: IAppBar(
//          "扫码"
//      ),
      appBar: AppBar(
        title: Text("主窗口"),
      ),
      body: scaffold2(context),
    );

  }

  @override
  Widget build(BuildContext context) {
    //return scaffold1();
//    return scaffold2(context);
    return scaffold3(context);
  }
}
