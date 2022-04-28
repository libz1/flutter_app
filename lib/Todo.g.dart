// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<dynamic, dynamic> json) => Todo()
  ..id = json['id']
  ..title = json['title']
  ..done = json['done'];

Map<dynamic, dynamic> _$TodoToJson(Todo instance) => <dynamic, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
    };
