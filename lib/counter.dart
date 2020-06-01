import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 它用于向监听器发送通知。可以订阅它的状态变化
class Counter extends ChangeNotifier{
  int value = 0;

  void increment(){
    value++;
    notifyListeners();
  }

  void sub(){
    value--;
    notifyListeners();
  }
}