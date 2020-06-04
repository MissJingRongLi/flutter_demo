import 'package:flutter/material.dart';



class DemoModel extends ChangeNotifier{
  DemoModel({this.counter = 0});

  int counter;

  int tapNum;

  void Increament(){
    counter++;
    notifyListeners();
  }

  void getEqument({int tapNum = 0}){
    counter = counter + tapNum;
    notifyListeners();
  }

  void settapNum(int num){
    tapNum = num;
  }
}
