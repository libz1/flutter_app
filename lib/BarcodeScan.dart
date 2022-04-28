import 'package:flutter/material.dart';
//import '../styles/app_style.dart';
import 'package:scan/scan.dart';

class BarcodeScan extends StatefulWidget {
//  final Function scanCode;

//  const BarcodeScan({Key key, this.scanCode}) : super(key: key);

  @override
  _BarcodeScanState createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  ScanController controller = ScanController();
  bool flashFlag = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [_scan(), _backIcon(), _title(), _hintText(), _flashIcon()],
        ),
      ),
    );
  }

  Widget _scan() {
    ///加column防止页面报错
    return Column(
      children: [
        Expanded(
            child: Container(
              child: ScanView(
                controller: controller,
                scanAreaScale: .7,
//                scanLineColor: KColor.primaryColor,
                scanLineColor: Colors.green,
                onCapture: (qrCode) {
                  setState(() {
                    Navigator.pop(context);
//                    widget.scanCode(qrCode);
                  });
                },
              ),
            )),
      ],
    );
  }

  /// < 返回
  Widget _backIcon() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, top: 55.0),
      child: InkWell(
        child: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: EdgeInsets.only(left: 165.0, top: 55.0),
      child: Text(
        '扫一扫',
        style: TextStyle(fontSize: 15.0, color: Colors.white),
      ),
    );
  }

  Widget _hintText() {
    return Padding(
      padding: EdgeInsets.only(left: 87.0, top: 555.0),
      child: Text(
        '将二维码放入框内，即可自动扫码',
        style: TextStyle(fontSize: 12.0, color: Colors.white),
      ),
    );
  }

  Widget _flashIcon() {
    return Container(
      margin: EdgeInsets.only(left: 332.0, top: 55.0),
      width: 27.0,
      child: InkWell(
        child: Image.asset(
          flashFlag
              ? 'images/icon-flash-on.png'
              : 'images/icon-flash-off.png',
          color: Colors.white,
        ),
        onTap: () {
          setState(() {
            controller.toggleTorchMode();
            flashFlag = !flashFlag;
          });
        },
      ),
    );
  }
}

