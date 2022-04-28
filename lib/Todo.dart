import 'package:json_annotation/json_annotation.dart';

part 'Todo.g.dart';

// xuky 2022.04.21 注意次序
// 参考  https://www.jianshu.com/p/84a0b551e3eb
@JsonSerializable()
class Todo {

  final String tableTodo = 'todo';
  final String columnId = '_id';
  final String columnTitle = 'title';
  final String columnDone = 'done';

  var id;
  var title;
  var done;

  //把当前类中转换成Map，以供外部使用
  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

//  //无参构造
  Todo();

  //把map类型的数据转换成当前类对象的构造函数。
//  Todo.fromMap(Map<String, Object?> map) {

  // xuky 2022.04.18 调整fromMap的入参类型
  Todo.fromMap(Map<dynamic, dynamic> map) {
    // 枚举类型进行数据格式转化   在实际使用的时候不适用
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone] == 1;
  }

  factory Todo.fromJson(Map<dynamic, dynamic> json) => _$TodoFromJson(json);
  Map<dynamic, dynamic> toJson() => _$TodoToJson(this);

//  ————————————————
//  原文作者：NiZerin
//  转自链接：https://learnku.com/articles/31768
//  版权声明：著作权归作者所有。商业转载请联系作者获得授权，非商业转载请保留以上作者信息和原文链接。

}
