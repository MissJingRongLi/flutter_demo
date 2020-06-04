import 'package:flutter/material.dart';

class MvvMProvider extends ChangeNotifier{
  String status = '请登录';

  MvvMProvider({@required LoginServive loginService});

  Future<void> login (String pwd) async {
    status = await LoginServive.login(pwd);
    notifyListeners();
  }
}

class LoginServive {
  static const String Login_path = 'xxxxxx';

  static Future<String> login(String pwd) async {
    return new Future.delayed(const Duration(seconds: 1), () => "登录成功");
  }
}