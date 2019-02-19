import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class JsonModelRouteTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 一个JSON格式的用户列表字符串
    String jsonStr = '[{"name":"Jack"},{"name":"Rose"}]';
    // JSON格式字符串转为Dart对象（此处是List）
    List items = json.decode(jsonStr);
    // 输出第一个用户的姓名
    print(items[0]["name"]);

    // 使用bean序列化
    String jsonStr1 = '{"name":"John Smith","email":"john@example.com"}';
    Map userMap = json.decode(jsonStr1);
    var user = new User.fromJson(userMap);
    print('user:');
    print('Howdy, ${user.name}!');
    print('We sent the verification link to ${user.email}.');

    print('toJson:');
    print(user.toJson());

    return Scaffold(
      appBar: AppBar(
        title: Text("JsonModel"),
      ),
    );
  }
}

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
      };
}

