import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

/// 加载assets
main(){
  loadAsset().then((data){
    print('success');
    print('data:$data');
  },onError: (e){
    print('failure');
    print(e);
  }).whenComplete((){
    print('complete');
  });
}

Future<String> loadAsset() async{
  return await rootBundle.loadString('assets/jsonTest.json');
}