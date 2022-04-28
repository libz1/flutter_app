package com.example.flutter_app;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
}

// xuky 2022.04.22 解决Flutter "No implementation found for method xxxx on channel"问题
// https://blog.csdn.net/feiyangyang980/article/details/107664101  无效
//import io.flutter.embedding.android.FlutterActivity;
//import io.flutter.embedding.engine.FlutterEngine;
//
//public class MainActivity extends FlutterActivity {
//
//    @Override
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        super.configureFlutterEngine(flutterEngine);
//    }
//}


//// xuky 2022.04.22 解决Flutter "No implementation found for method xxxx on channel"问题
////  https://www.jianshu.com/p/525e97bb988b  无效
//import android.annotation.SuppressLint;
//import android.os.Bundle;
//// 重点1
//import io.flutter.embedding.android.FlutterActivity;
//import io.flutter.embedding.engine.FlutterEngine;
//import io.flutter.plugin.common.MethodChannel;
//import androidx.annotation.NonNull;
//import io.flutter.plugins.GeneratedPluginRegistrant;
//
//public class MainActivity extends FlutterActivity {
//
//    private String flutterMethodChannelName = "flutterCallbackMethodChannel";
//    MethodChannel methodChannel_callFlutter;
//
//    @SuppressLint("NewApi")
//    public void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        methodChannel_callFlutter = new
//                // 重点2
//                MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), flutterMethodChannelName);
//    }
//
//    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//        // 重点3
//        super.configureFlutterEngine(flutterEngine);
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//    }
//}