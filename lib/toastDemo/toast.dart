import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MyOkToast extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: (){showToast("hello");},child: Text("showToast")),
          RaisedButton(onPressed: (){showToastWidget(CorrectToast());},child: Text("自定义Toast")),
        ],
      ),
    );
  }
}

class CorrectToast extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 140,
      color: Colors.green,
      child: new Text('hello'),
    );
  }

}