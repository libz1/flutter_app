import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';
import 'package:flutter/material.dart';


// 条码扫描功能
// 参考 https://blog.csdn.net/llh_llh_/article/details/120162934
class ScanPage extends StatelessWidget {

  final String phoneNumber;
  ScanPage({Key? key, required this.phoneNumber}) : super(key: key);

  IconData lightIcon = Icons.flash_on;
  final ScanController _controller = ScanController();

  void getResult(String result, BuildContext context){
    //TODO
//    print( "getResult result="+result );
//    print( "getResult BuildContext="+context.toString() );

    Navigator.pop(context,result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: IAppBar(
//          "扫码"
//      ),
        appBar: AppBar(
          title: Text("扫码"),
        ),
      body: Stack(
          children: [ScanView(
            controller: _controller,
            scanLineColor: Color(0xFF4759DA),
            onCapture: (data) {
              _controller.pause();
              getResult(data,context);
            },
          ),
            Positioned(
              left: WH.w(100),
              bottom: WH.w(100),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return MaterialButton(
                      child: Icon(lightIcon,size: WH.w(80),color: Color(0xFF4759DA),),
                      onPressed: (){
                        _controller.toggleTorchMode();
                        if (lightIcon == Icons.flash_on){
                          lightIcon = Icons.flash_off;
                        }else {
                          lightIcon = Icons.flash_on;
                        }
                        setState((){});
                      }
                  );
                },
              ),
            ),
            Positioned(
              right: WH.w(100),
              bottom: WH.w(100),
              child: MaterialButton(
                  child: Icon(Icons.image,size: WH.w(80),color: Color(0xFF4759DA),),
                  onPressed: () async {
                    List<Media>? res = await ImagesPicker.pick(
                        count: 1,
                        maxSize: 1024
                    );
                    if (res != null) {
                      _controller.pause();
                      Media image = res.first;
                      String? result = await Scan.parse(image.path);
                      if(result != null){
                        getResult(result,context);
                      }
                    }
                  }
              ),
            ),
          ]
      ),
    );
  }
}

class WH {
  static  double w(double data){
    return data;
  }
}

