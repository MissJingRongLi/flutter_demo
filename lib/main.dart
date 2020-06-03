import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/state_provider/counter.dart';
import 'package:state_provider/state_provider/firstPage.dart';

void main(){

  runApp(MyApp()
    // 全局注册的数据提供者 ChangeNotifierProvider -- create
     );
}

class MyApp extends StatelessWidget {
  static Counter counter;

  MyApp() {
    // counter实例只能被初始化一次
    counter = Counter();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ChangeNotifierProvider.value(
      // ChangeNotifierProvider返回一个widget 为FirstPage与SecondPage的父节点
      value: counter, 
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FirstPage(title: 'First Page'),
      ),
    )
    );
  }
}