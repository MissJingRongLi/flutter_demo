import 'package:flutter/material.dart';

enum Status { none, running, stopped, paused }

Stream<dynamic> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return Status.values[i];
  });
}

class StatusModel extends ChangeNotifier{
  int num = 0;
  var status = Status.values[0];

  void changeStatus(){
    num++;
    status = Status.values[num];
    notifyListeners();
  }
}