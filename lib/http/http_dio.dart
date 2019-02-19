import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';

class HttpDioRouteText extends StatelessWidget {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio package"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("get请求"),
                onPressed: () {
                  getHttp();
                },
              ),
            ],
          ),
        ),
      )),
    );
  }

  void getHttp() async {
    try {
      Response response;
      response = await _dio.get("https://www.baodu.com");
      return print(response);
    } catch (e) {
      return print(e);
    }
  }
}
