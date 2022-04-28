import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'ScanPage.dart';
import 'Todo.dart';

import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:typed_data';

//void main() {
//  runApp(const MyApp());
//}

// xuky 2022.03.28 这个写法应该是lambda表达式
void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // xuky 2022.03.28 学习Flutter中遇到的第一个控件 MaterialApp

    // 声明一个颜色数组  // 注意 这里需要分号;
    // 声明一个颜色数组  // 注意 这里需要分号;
    const bgColor = const [Colors.green, Colors.red, Colors.blue];

    bool isCheck = true;
    bool _isShow = true;

    // UI 中不要写new MaterialApp(...)是构造函数
    // ctrl + 鼠标左键 ，可以查看程序的详细内容
    // MaterialApp构造函数中 参数的含义参考 https://mp.weixin.qq.com/s/P0ShnVrPpvIZcSWAnPJVmg “MaterialApp属性详解”

    // ctrl + \  热更新  无需重新加载，app就显示变化 Flutter Hot Reload
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        primarySwatch: Colors.blue,
      ),

      // p1、主界面UI从这里开始
      // appBar、body、FAB -> Scaffold -> State(MyHomePageState) -> StatefulWidget(MyHomePage) -> StatelessWidget(MyApp  MaterialApp)
//      home: const MyHomePage(title: 'Flutter Demo Home Page'),

      // xuky 2022.04.12 伸缩效果
      home: HomePage3(

//      ),

//        // xuky 2022.04.11 模仿安卓设置界面

//      // N1、直接接入 Scaffold
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("123"),
//        ),
//
//        body: Container(
//          color: Colors.grey[200], // grey[200]表示对灰度进行深度调整 这里表示不是很深的灰色
//          child: Column(
//            children: <Widget>[
//              Container(
//                padding: const EdgeInsets.symmetric(horizontal: 16),
//                // 主体外，美化相关的设置 -- 设置一行数据的左侧和右侧留空
//                height: 60,
//                // 主体外，美化相关的设置  -- 设置一行数据的显示高度
//                color: Colors.white,
//                child: Row(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(right: 16.0),
//                      // 主体外，美化相关的设置  -- 设置图标与右侧文字之间的间距
//                      child: Icon(
//                        Icons.wifi,
//                        color: Colors.blueAccent,
//                      ),
//                    ),
//                    Expanded(   //Expanded 布局  实现自动缩放 ，占用除了前面和后面两个图标之外的其他空间  用在弹性布局等  row column
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        // 主体外，美化相关的设置  -- 让显示的文字在每一行上垂直居中
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        // 主体外，美化相关的设置  -- 让显示的文字左对齐  交叉轴数据左对齐
//                        children: <Widget>[
//                          Text("网络和互联网", style: TextStyle(fontSize: 18)),
//                          Text("WLAN、移动网络、流量使用、移动网络、流量使用、移动网络、流量使用、移动网络、流量使用、移动网络、流量使用、移动网络、流量使用",  // 文字太长可能会出现溢出的情况
//                              maxLines: 1,  // maxLines: 1  进行显示宽度的限制
//                              overflow: TextOverflow.ellipsis,  // 当显示不开的时候，添加省略号
//                              style: TextStyle(color: Colors.grey[600]))
//                        ],
//                      ),
//                    ),
//                    Icon(Icons.arrow_forward_ios,color: Colors.grey
//                    )
//
//                  ],
//                ),
//              ),
//              Container(
//                margin: const EdgeInsets.only(top: 10),
//                padding: const EdgeInsets.symmetric(horizontal: 16),
//                // 主体外，美化相关的设置 -- 设置一行数据的左侧和右侧留空
//                height: 60,
//                // 主体外，美化相关的设置  -- 设置一行数据的显示高度
//                color: Colors.white,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 让两个控件分别处在两端
//                  children: <Widget>[
//                    Text("设置项目1", style: TextStyle(fontSize: 18),),
//                    Checkbox(value: isCheck, onChanged:(val){
//
//                    }),
//                    Switch(value: isCheck, onChanged: (val){
//
//                    }),
//                    CupertinoSwitch(value: isCheck, onChanged: (val){
//
//                    }),
//
//                  ],
//                )
//
//              ),
//              Container(
//                  margin: const EdgeInsets.only(top: 10),
//                  padding: const EdgeInsets.symmetric(horizontal: 16),
//                  // 主体外，美化相关的设置 -- 设置一行数据的左侧和右侧留空
//                  height: 60,
//                  // 主体外，美化相关的设置  -- 设置一行数据的显示高度
//                  color: Colors.white,
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 让两个控件分别处在两端
//                    children: <Widget>[
//                      Text("音量", style: TextStyle(fontSize: 18),),
//                      Slider(
//
//                          value: 0.1, onChanged: (val){
//
//                      })
//
//                    ],
//                  )
//
//              ),
//            ],
//          ),
//        ),

//          body: Text("Hello World!")

          // xuky 2022.04.06 弹性布局Flex学习
          // Flex的构造函数中 标注了 required this.direction,  表示这个参数是必须提供的
          // children 是数组类型的数据

//            // DRY 原则 don't repeat yourself
//            // 下面代码中的Container...Container...Container...可以修改为更好的写法，使用列表生成器
//            body: Stack(
//              children: <Widget>[
//                // xuky 2022,04.08 卡片式布局
//                AspectRatio(
//                  aspectRatio: 4/3,
//                  child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimage9.huangye88.cn%2F2015%2F01%2F28%2F2c7cb00950aa0a10.jpg&refer=http%3A%2F%2Fimage9.huangye88.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1651971206&t=2c7b13133fc75a538a051bebeb7828d5",
//                  fit: BoxFit.cover,)
//                ),
//              ],
//            )

//            body: Container(
//              child: Container(
//                constraints: BoxConstraints.expand(),
//                color: Colors.grey,
//                child: Container(
//                  child: Flex(direction: Axis.vertical,
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 主轴的对齐方式
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      // xuky 2022.04.06 代码不重复的优化写法
//                      // 注意 这里需要分号;
//                      // List.generate(int length, E generator(int index),
//                      children: List<Widget>.generate(3,(i){
//                        return Container( width: 100,height:100, color:bgColor[i],child: Text("$i",style:TextStyle( color: Colors.white,fontSize:29) ));
//                      })
//
//                      // xuky 2022.04.06 代码重复的写法
////                children: <Widget>[
////                  Container(
////                    width:100,height: 200,color: Colors.green,
////                  ),
////                  Container(
////                    width:100,height: 200,color: Colors.red,
////                  ),
////                  Container(
////                    width:100,height: 200,color: Colors.blue,
////                  ),
////                ],
//                  ),
//                ),
//              ),
//            ),

//            // xuky 2022.04.01 万能容器 Container 学习
//            body: Container(
//                alignment: Alignment.topLeft,  //表示对齐方式
//
//                width: 300,  // shift+ 换行  可以确保整行代码的完整
//              height: 500,
////              color: Colors.blue,
//
//              //  final EdgeInsetsGeometry? margin  是一个抽象类
//              // 需要给定4个参数
////              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
//              // 给定指定参数的属性
//              margin: EdgeInsets.only(left:20,top:20)    ,
//                decoration: BoxDecoration(
////                    shape: BoxShape.circle,
//                    color: Colors.yellow,
//                    border: Border.all(color: Colors.blue,width:1,style: BorderStyle.solid),
////                    borderRadius: BorderRadius.circular(5),
////                    boxShadow:[ BoxShadow(color:Colors.grey,blurRadius:18.0) ],
////                        image: NetworkImage("https://bkimg.cdn.bcebos.com/pic/03087bf40ad162d9ab4895b11bdfa9ec8b13cdfd?x-bce-process=image/resize,m_lfit,w_536,limit_1/format,f_jpg")
////                    )
//                )
//            ),

//          body: Center(
//
//            // 查看  Text的属性 ，有 style ，类型为TextStyle 所以可以构建代码 style: TextStyle()  相当于 style: new TextStyle() ，其中的new其实是被省略的
//            // 1
////            child: Text("Hello World!",
////                style: TextStyle(
//////                color: Color.fromARGB(100,255,0,0)
////                  color: Colors.blue,  // 左边的色块，表示当前颜色的显示结果
////                  fontSize: 26.5,
////                    fontWeight: FontWeight.w900
////                )
////            ),
////              child: Icon(Icons.people,size:100,color:Colors.blue)
////              child: Icon(CupertinoIcons.home,size:100,color:Colors.blue)
//              child: Image.network("https://t10.baidu.com/it/u=2997687561,1624615589&fm=173&app=49&f=JPEG?w=640&h=500&s=03337984ABFA368C5FC3FB1B0300A0D1",
//              width :300,height: 200)
//
//          )
          ),
    );
  }
}

//// p2、 StatefulWidget  有状态 组件  自己写的界面程序
//class MyHomePage extends StatefulWidget {
//  const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//  final String title;
//
//  // p3、继续深入
//  @override
//  State<MyHomePage> createState() => _MyHomePageState();
//}
//
//// P4、最根本 继承了 State
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  // p5、重要方法 build
//  @override
//  Widget build(BuildContext context) {
//    // p6、又套了一个 Scaffold
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//
//      // p7、 body属性
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            const Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
//
//      // p8、FAB
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter, // 执行 _incrementCounter函数  放在State类中
//        tooltip: 'Increment',
//        child: const Icon(Icons.add), // 显示加号图表
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}

// 2022.04.14 根据抢修工单的UI设计进行实现
class HomePage3 extends StatefulWidget {
  @override
  _HomePage3State createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    const bgColor = const [Colors.green, Colors.red, Colors.blue];

    PopupMenuItem<String> buildPopupMenuItem(
        IconData icon, String text, String id) {
      return PopupMenuItem<String>(
          value: id,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(icon, color: Colors.blue),
              Text(text),
            ],
          ));
    }

    // xuky 2022.04.18 执行耗时操作前 添加await标记；在对应的函数后 添加async标记
    dbOperate() async {


      // 参考 https://blog.csdn.net/bugmiao/article/details/116993667 原文中问题很多

      DateTime dateTime = DateTime.now();
      String dt = dateTime.toString().substring(0, 23);
      print(dt + " log:  dbOperate");

//      var db = await openDatabase('my_db1.db');
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, 'my_db2.db');

      print(dt + " log:  path=" + path);

      // xuky 2022.04.18 不能在之前openDatabase
      // 在这里openDatabase 同时会 调用 onCreate ，实现  CREATE TABLE Test
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        // 创建数据库时创建表
        await db.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      });
//      原文链接：https://blog.csdn.net/bugmiao/article/details/116993667

      // xuky 2022.04.18 使用SQL方式进行数据操作
//      await database.transaction((txn) async {
//
//        // 完整的SQL语句
//        int id1 = await txn.rawInsert(
//            'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
//        print('inserted1: $id1');
//
//        // SQL语句 + 所需要的参数集合
//        int id2 = await txn.rawInsert(
//            'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
//            ['another name', 12345678, 3.1416]);
//        print('inserted2: $id2');
//      });

      //int count = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
      int? count = 0;
      count = Sqflite.firstIntValue(
          await database.rawQuery('SELECT COUNT(*) FROM Test'));
      print(dt + " log:  count=" + count.toString());
      //await database.rawQuery(sql).rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
//      int count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));

      List<Map> list = await database.rawQuery('SELECT * FROM Test');
      List<Map> expectedList = [
        {'id': 1, 'name': 'updated name', 'value': 9876, 'num': 456.789},
        {'id': 2, 'name': 'another name', 'value': 12345678, 'num': 3.1416}
      ];
      print(dt + " log:  rawQuery list=\n" + list.toString());
      print(dt + " log:  expectedList =\n" + expectedList.toString());

      list.forEach((f) {
        print(f["value"]);
      });

      // xuky 2022.04.18 使用 SQL 助手进行数据库操作
      path = join(databasesPath, 'my_Todo.db');

      // s1、构建TodoProvider
      var todoProvider = TodoProvider();

      // s2、初始化TodoProvider
      await todoProvider.open(path);

      // s3、创建对象，对象属性进行赋值
      var todo = Todo();
      todo.id = "2";
      todo.title = "new data 2";
      todo.done = 1;

      Map json_data = todo.toJson();
      print("todo.toJson()="+json_data.toString());


      Map map = {'_id': 3, 'title': 'updated name2', 'done': 0};
      //map = todo.toMap();
      //print(dt + " log:  map =\n" + map.toString());

      // 将map中的键值对数据转为 对象的内容
      todo = Todo.fromMap(map);
      print("todo.toJson()="+todo.toJson().toString());

      todo = Todo.fromJson(json_data);

      print("todo.toJson()="+todo.toJson().toString());


      // s4、将对象插入到todoProvider的数据库中
      await todoProvider.insert(todo);

      // s5、根据id信息从数据库中查询数据 返回结果放在对象中
      todo = await todoProvider.getTodo(3);
      print(dt + " log:  todo =\n" + todo.toMap().toString());

      // s6、批量操作1
      Database db = todoProvider.db;
//      Batch batch = db.batch();
//      // insert(String table, Map<String, Object?> values,
//      batch.insert('todo', {'_id': 5, 'title': "5", 'done': 0});
//      batch.insert('todo', {'_id': 6, 'title': "6", 'done': 0});
//      batch.insert('todo', {'_id': 7, 'title': "6", 'done': 0});
//      batch.update('todo', {'title': '5-1'}, where: '_id = ?', whereArgs: [5]);
//      batch.delete('todo', where: '_id = ?', whereArgs: [7]);
//      await batch.commit();

      // s7、批量操作2
      await db.transaction((txn) async {
        print("database.transaction... " + db.toString());

        var batch = txn.batch();

        batch.insert('todo', {'_id': 51, 'title': "5", 'done': 0});
        batch.insert('todo', {'_id': 61, 'title': "6", 'done': 0});
        batch.insert('todo', {'_id': 71, 'title': "6", 'done': 0});
        batch.update('todo', {'title': '5_1-1'}, where: '_id = ?', whereArgs: [51]);
        batch.delete('todo', where: '_id = ?', whereArgs: [71]);
        // ...

        // commit but the actual commit will happen when the transaction is committed
        // however the data is available in this transaction
        await batch.commit();

        //  ...
      });
//      ————————————————
//      版权声明：本文为CSDN博主「斯音」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//      原文链接：https://blog.csdn.net/bugmiao/article/details/116993667

//      final String tableTodo = 'todo';
//      final String columnId = '_id';
//      final String columnTitle = 'title';
//      final String columnDone = 'done';
//
////对应类
//      class Todo {
//      var id;
//      var title;
//      var done;


//      bool results = await batch.commit();

//      ————————————————
//      版权声明：本文为CSDN博主「斯音」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//      原文链接：https://blog.csdn.net/bugmiao/article/details/116993667
      await todoProvider.close();


//      todo.
//      todo.fromMap(map);
//
//      todoProvider.insert(todo)

//      List<Map<String, Object?>> records = await db.query('my_table');
//
//      Map<String, Object?> mapRead = records.first;
//      Map<String, Object?> map = Map<String, Object?>.from(mapRead);
//      // 在内存中修改此副本中存储的字段值
//      map['my_column'] = 1;

//      // Convert the List<Map<String, dynamic> into a List<Todo>.
//      return List.generate(maps.length, (i) {
//        return Todo(
//          id: maps[i][columnId],
//          title: maps[i][columnTitle],
//          done: maps[i][columnDown],
//        );
//      });

//      var batch = db.batch();
//      batch.insert('Test', {'name': 'item'});
//      batch.update('Test', {'name': 'new_item'}, where: 'name = ?', whereArgs: ['item']);
//      batch.delete('Test', where: 'name = ?', whereArgs: ['item']);
//      var results = await batch.commit();

//      ————————————————
//      版权声明：本文为CSDN博主「After life」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//      原文链接：https://blog.csdn.net/llh_llh_/article/details/120162934

      // xuky 2022.04.21 json处理
      var todo1 = Todo();
      todo.id = "2";
      todo.title = "new data 2";
      todo.done = 1;

    }

    // xuky 2022.04.20 在新窗口中打开UI界面 内容为ScanPage  extends StatelessWidget
    // 参考 https://blog.csdn.net/llh_llh_/article/details/120162934
    //scandBarcode() async {
    scandBarcode() async {
      dynamic customArgumnets = await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return ScanPage(phoneNumber: "123");
      }));

      print( "scandBarcode result = " + customArgumnets);
    }
    readXLSX() async {

//      // xuky 2022.04.24 在模拟器上可供选择的目录很少，无法获得有效数据
//      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
//        type: FileType.custom,
//        allowedExtensions: ['xlsx'],
//        allowMultiple: false,
//      );
//
//      /// file might be picked
//      if (pickedFile != null) {
////        Uint8List? bytes = pickedFile.files.single.bytes;
//
//        var bytes = File(pickedFile.files.single.toString()).readAsBytesSync();
//
////        List<int> data = List<int>.from(bytes);
//        // Excel.decodeBytes(List<int> data)  入参是 List<int>类型
//        // pickedFile.files.single.bytes是 Uint8List?类型
//        var excel = Excel.decodeBytes(bytes);
//        for (var table in excel.tables.keys) {
//          print(table); //sheet Name
////          print(excel.tables[table].maxCols);
////          print(excel.tables[table].maxRows);
////          for (var row in excel.tables[table].rows) {
////            print("$row");
////          }
//        }
//      }
//      else{
//        print("未选择任何文件");
//
//      }

      Directory directory = await getApplicationDocumentsDirectory();
      String directory_path = directory.path;
      var file = join("$directory_path/output_file_name3.xlsx");
      var bytes = File(file).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        print(table); //sheet Name
//        Sheet? sheet = excel.tables[table];
//        print(sheet?.maxCols); //sheet Name
////        int maxC = table1.maxCols;

        // xuky 2022.04.24 对于可能为null类型数据的处理
        // 1、添加 ? 然后进行访问
        // 2、赋值给 ? 类型的变量，然后判断是否为空后进行处理
        print(excel.tables[table]?.maxCols);
        print(excel.tables[table]?.maxRows);
        Sheet? sheet = excel.tables[table];
        if (sheet!= null){
          for (var row in sheet.rows) {
            print("$row");
          }
        }
      }

    }
    writeXLSX() async {

      var excel = Excel.createExcel(); // automatically creates 1 empty sheet: Sheet1

      var defaultSheet = excel.getDefaultSheet();
      print("Default Sheet:" + defaultSheet.toString());

//      Sheet sheetObject = excel['SheetName'];
      Sheet sheetObject = excel[defaultSheet.toString()];

      CellStyle cellStyle = CellStyle(backgroundColorHex: "#1AFF1A", fontFamily : getFontFamily(FontFamily.Calibri));

      cellStyle.underline = Underline.Single; // or Underline.Double


      var cell = sheetObject.cell(CellIndex.indexByString("A1"));
      cell.value = 8; // dynamic values support provided;
      cell.cellStyle = cellStyle;

      // printing cell-type
      print("CellType: "+ cell.cellType.toString()+" cellIndex: "+cell.cellIndex.toString()+" cell.value: "+cell.value.toString());


      cell = sheetObject.cell(CellIndex.indexByString("B2"));
      cell.value = "8"; // dynamic values support provided;
      cell.cellStyle = cellStyle;
      print("CellType: "+ cell.cellType.toString()+" cellIndex: "+cell.cellIndex.toString()+" cell.value: "+cell.value);

      cell = sheetObject.cell(CellIndex.indexByString("A2"));
      cell.value = 16; // dynamic values support provided;

      cell = sheetObject.cell(CellIndex.indexByString("A3"));
      cell.value = 32; // dynamic values support provided;

      cell = sheetObject.cell(CellIndex.indexByString("A4"));
      cell.value = 64; // dynamic values support provided;
      ///
      /// Inserting and removing column and rows

//      // insert column at index = 8
//      sheetObject.insertColumn(8);
//
//      // remove column at index = 18
//      sheetObject.removeColumn(18);
//
//      // insert row at index = 82
//      sheetObject.insertRow(82);
//
//      // remove row at index = 80
//      sheetObject.removeRow(80);

      Directory directory = await getApplicationDocumentsDirectory();

      String directory_path = directory.path;
      print("directory.path="+directory_path);

      // xuky 2022.04.24 anotherSheetName中的行高与列宽 与默认页面不同
      excel.copy('Sheet1', 'anotherSheetName');

      var fileBytes = excel.save();

      // xuky 问题解决  MissingPluginException(No implementation found for method * on channel *)
      // https://www.jianshu.com/p/d4502dd71371

      File f= File(join("$directory_path/output_file_name3.xlsx"))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
      print("f.path="+f.path);
    }

    // xuky 2022.04.20
    // 参考https://flutterchina.club/cookbook/navigation/returning-data/


      return Scaffold(
        appBar: AppBar(
          leading: Container(
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            "抢修工单 v1.02",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            // 非隐藏的菜单
            IconButton(
                icon: Icon(Icons.app_registration),
                tooltip: 'SQLite Operate',
                onPressed: () {
                  dbOperate();
                }),
            // 隐藏的菜单
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                buildPopupMenuItem(Icons.message, '数据库交互', 'A'),
                buildPopupMenuItem(Icons.group_add, '添加服务', 'B'),
                buildPopupMenuItem(Icons.cast_connected, '扫一扫码', 'C'),
                buildPopupMenuItem(Icons.cast_connected, '写入xlsx文件', 'D'),
                buildPopupMenuItem(Icons.cast_connected, '读取xlsx文件', 'E'),
              ],
              onSelected: (String action) {
                // 点击选项的时候
                switch (action) {
                  case 'A':
                    dbOperate();
                    break;
                  case 'B':
                    break;
                  case 'C':
                    scandBarcode();
                    break;
                  case 'D':
                    writeXLSX();
                    break;
                  case 'E':
                    readXLSX();
                    break;
                }
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.grey[200],
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 210,
                      color: Colors.grey[200],

//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(12),
//                          color: Color.fromRGBO(0, 0, 0, 0.5)
//                      ),

                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.red,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Text("$index配电室的抢修工单"),
                                    ),
                                    Container(
                                      child: Text("抢修任务单号"),
                                    ),
                                    Container(
                                      child: Text("抢修任务区域"),
                                    ),
                                    Container(
                                      child: Text("抢修结束时间"),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child:
                                Container(color: Colors.green, child: Column()),
                          )
                        ],
                      )),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider(
                  color: Colors.grey,
                  height: 2,
                );
              },
              itemCount: 5),
        ));
  }
}

class SelectView {
  SelectView(IconData group_add, String s, String t);
}

// 2022.04.13 复杂布局 高级布局  ListView的实现过程
class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    const bgColor = const [Colors.green, Colors.red, Colors.blue];

    return Scaffold(
        appBar: AppBar(
          leading: Container(
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            "抢修工单",
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          color: Colors.grey[200],
//            //  Level-3 ListView.separated 批量添加元素  中间添加分割栏
          child: ListView.separated(
              itemBuilder: (ctx, index) {
                return Container(
                    height: 230,
                    color: Colors.grey[200],
                    child: Text("$index"));
              },
              separatorBuilder: (ctx, index) {
                return Divider(
                  color: Colors.grey,
                  height: 8,
                );
              },
              itemCount: 30),

//            //  Level-2 ListView.builder 批量添加元素
//        child: ListView.builder(
//            itemCount: 16,  // 如果不设定数量，则此大小为无穷大
//            itemBuilder: (ctx,index){
//              return Container( height: 70,color: bgColor[index%3],
//                  child: Text("$index"))  ;
//            }
//        ),

//            //  Level-2 ListView 批量添加元素
//          child: ListView(
//            children: List.generate(30, (index) {
//              return Container( height: 70,color: bgColor[index%3],
//              child: Text("$index"),
//              );
//            })
//
//              //  Level-1  ListView 逐个添加元素
////            children: <Widget>[
////              Container(height: 70,color: Colors.red,),
////              Container(height: 70,color: Colors.green,),
////              Container(height: 70,color: Colors.blue,),
////            ],
//
//          ),
        ));
  }
}

// xuky 2022.04.12 有状态的 widget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// 2022.04.12 启用背景模式  可以收起来和展开的UI  基础布局小案例3
class _HomePageState extends State<HomePage> {
  bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    print("_HomePageState build!");
    return Scaffold(
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://seopic.699pic.com/photo/50044/5259.jpg_wh1200.jpg"))),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromRGBO(0, 0, 0, 0.5)),
          margin: EdgeInsets.only(top: 60),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0), // xuky 2022.04.11 添加边距信息
                child: Text("标题1",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                // Visibility 用于控制是否可视
                child: Visibility(
                    visible: _isShow,
                    child: Text(
                        "以下文字可以被隐藏和恢复显示！以下文字可以被隐藏和恢复显示！以下文字可以被隐藏和恢复显示！以下文字可以被隐藏和恢复显示！以下文字可以被隐藏和恢复显示！以下文字可以被隐藏和恢复显示！",
                        style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
              IconButton(
                  icon: Icon(
                    _isShow
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // 用于控制是否可视   需要整体继承StatefulWidget
                    // 会自动回调build函数
                    setState(() {
                      print("IconButton clicked setState!");
                      _isShow = !_isShow;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

//字段
final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';

//对应类

// xuky 2022.04.21 添加json支持
// 参考 https://learnku.com/articles/31768

//part 'main.g.dart';


class TodoProvider {
  var db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          print("onOpen db.execute..." + db.toString());
      await db.execute('''
  create table $tableTodo (
  $columnId integer primary key autoincrement,
  $columnTitle text not null,
  $columnDone integer not null)
                        ''');
    }, onOpen: (Database db) async {
          print("onOpen db" + db.toString());
    });
  }

  //向表中插入一条数据，如果已经插入过了，则替换之前的。
  Future<Todo> insert(Todo todo) async {
    todo.id = await db.insert(
      tableTodo,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return todo;
  }

  Future<Todo> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    //if (maps.length > 0) {
    return Todo.fromMap(maps.first);
    //}
    //return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}
