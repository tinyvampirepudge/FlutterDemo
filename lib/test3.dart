/// 异步支持——Future
main() {
//  Future.delayed(new Duration(seconds: 2),(){
//    return "hello world";
//  }).then((data){
//    print(data);
//  });
//
//  Future.delayed(new Duration(seconds: 2),(){
//    throw AssertionError("Custom Error");
//  }).then((data){
//    print("success");
//  }).catchError((e){
//    print('failure');
//    print(e);
//  });

  // then有个可选参数：onError
//  Future.delayed(new Duration(seconds: 2),(){
//    throw AssertionError("Error");
//  }).then((data){
//    print('success');
//  },onError: (e){
//    print('failure');
//    print(e);
//  });

//  Future.delayed(new Duration(seconds: 2), () {
////    throw AssertionError('Error');
//    return "王蛋蛋的芭比";
//  }).then((data) {
//    print('success $data');
//  }, onError: (e) {
//    print('failure');
//  }).whenComplete(() {
//    print('whenComplete');
//  });

//  Future.wait([
//    Future.delayed(new Duration(seconds: 2), () {
////      return "Hello";
//      throw AssertionError('Error');
//    }),
//    Future.delayed(new Duration(seconds: 4), () {
//      return "world";
//    })
//  ]).then((results) {
//    print('success');
//    print('${results[0]} ${results[1]}');
//  }, onError: (e) {
//    print('failure');
//    print(e);
//  });

//  login("tinytongtong", "wangdandandefather").then((id) {
//    getUserInfo(id).then((userInfo) {
//      saveUserInfo(userInfo).then((result) {
//        print('流程完成');
//      });
//    });
//  });

//  login("tinytongtong", "wangdandandemother").then((id) {
//    return getUserInfo(id);
//  }).then((userInfo) {
//    return saveUserInfo(userInfo);
//  }).then((data) {
//    print('流程完成了');
//  }, onError: (e) {
//    print('failure');
//    print(e);
//  });

//  task();

  Stream.fromFutures([
    Future.delayed(new Duration(seconds: 1), () {
//      return "hello 1";
      throw AssertionError("Error 1");
    }),
    Future.delayed(new Duration(seconds: 2), () {
//      return "hello 2";
      throw AssertionError("Error 2");
    }),
    Future.delayed(new Duration(seconds: 3), () {
//      return "hello 3";
      throw AssertionError("Error 3");
    }),
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print('onError');
    print(e.message);
  }, onDone: () {
    print('onDone');
  });
}

task() async {
  try {
    String id = await login("alice", "******");
    print('111');
    String userInfo = await getUserInfo(id);
    print('222');
    await saveUserInfo(userInfo);
    print('333');
  } catch (e) {
    print(e);
  }
}

Future<String> login(String userName, String pwd) {
  return Future.delayed(new Duration(seconds: 2), () {
    print('用户名:$userName,密码:$pwd');
    return '10086';
  });
}

Future<String> getUserInfo(String id) {
  return Future.delayed(new Duration(seconds: 2), () {
    print('用户信息:$id');
    return '王蛋蛋的芭比就是我，我就是我王蛋蛋的芭比。';
  });
}

Future<String> saveUserInfo(String userInfo) {
  return Future.delayed(new Duration(seconds: 2), () {
    print('用户信息:$userInfo');
    return 'asdfaklsdfjaksjdf;lakj';
  });
}
