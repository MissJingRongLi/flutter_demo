import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class showToastDiy {
  // 警告
  static void warning(String msg) {
    showToastWidget(CorrectToast(text: msg, bgColor: Colors.white, textColor: Colors.black, textSize: 18.0,));
  }
  // 通知
  static void info(String msg) {
    showToastWidget(CorrectToast(text: msg, bgColor: Colors.blueGrey, textColor: Colors.black, textSize: 18.0,));
  }
  // 错误
  static void error(String msg ) {
    showToastWidget(CorrectToast(text: msg, bgColor: Colors.red, textColor: Colors.black, textSize: 18.0,));
  }
  // 成功
  static void success(String msg) {
    showToastWidget(CorrectToast(text: msg, bgColor: Colors.green, textColor: Colors.black, textSize: 18.0,));
  }
}

// toast绘制
class CorrectToast extends StatelessWidget {
  final String text;//显示内容
  final Color bgColor; //背景色
  final Color textColor; // 文本颜色
  final double textSize; // 文字大小 
  CorrectToast({Key key, this.text, this.bgColor, this.textColor, this.textSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Positioned(
          top: 20,
          child: Container(
            width: 340,
            height: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              shape: BoxShape.rectangle,
              color: bgColor,
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add),
                  // 增加间距
                  new Container(width: 3),
                  Text(text,
                  style: TextStyle(
                      color: textColor,
                      decoration: TextDecoration.none,
                      fontSize: textSize)),
                ],
              )
            ),
          ),
        )
      ],
    );
  }
}
