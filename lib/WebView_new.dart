import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView_new extends StatelessWidget {
  final String phoneNumber;

  WebView_new({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffold1();
//    return scaffold2(context);
//    return scaffold3(context);
  }

  Scaffold scaffold1(){
    return Scaffold(
      appBar: AppBar(
        title: Text("Web View"),
      ),
      body: WebView(
        initialUrl: "https://www.baidu.com/",
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          print("onPageStarted $url");
        },
        onPageFinished: (String url) {
          print("onPageFinished $url");
        },
        onWebResourceError: (error) {
          print("${error.description}");
        },
      ),

//        ————————————————
//    版权声明：本文为CSDN博主「Eternity岚」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//    原文链接：https://blog.csdn.net/u014653815/article/details/117920212
    );

  }

}