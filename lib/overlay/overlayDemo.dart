import 'dart:async';

import 'package:flutter/material.dart';

// Overlay 主要就是两个方法，往Overlay中插入entry，删除Overlay中的entry。
// 利用overlay实现一个toast

class MyToast {
  static const MIN_INVERVAL = 2000; //设置默认间隔
  static String lastMsg; 
  static int lastShowms = DateTime.now().millisecondsSinceEpoch; // 记录上一个弹窗出现时间
  static Future _lastToast;

  static Info(BuildContext context, {@required String msg}){
    _handleDuplicateAndShow(context, msg: msg);
  }

  // 处理重复点击 
  static void _handleDuplicateAndShow(BuildContext context, {@required String msg}){
      // int currentTms = DateTime.now().millisecondsSinceEpoch; //记录当前时间
      // int interval = currentTms - lastShowms;
      // // 确保当前弹窗显示足够的时间
      // if(interval > MIN_INVERVAL){ 
      //   _show(context, msg: msg, currentTms: currentTms);
      // }
    if(_lastToast != null){
      _lastToast = _lastToast.then((value) async{
       return await _show(context, msg: msg);
      });
    } else {
      _show(context, msg: msg);
    }

    
  }

  static Future _show(BuildContext context, {@required String msg}) {
    OverlayEntry entry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              shape: BoxShape.rectangle,
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Center(
                  child: Text(msg,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                      )),
                )
          )
        ],
      );
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(entry);
    //两秒后，移除Toast
    Future result = Future.delayed(Duration(seconds: 2)).then((value) {
      entry.remove();
    });

    _lastToast = result;
    return result;
  }
}
