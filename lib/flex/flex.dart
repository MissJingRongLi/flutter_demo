import 'package:flutter/material.dart';

class FlexLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(left:20, right: 20),
        child: Row(
        children: <Widget>[
          Expanded(flex: 1, child: Center(child:Text('flex1'))),
          Expanded(flex: 2, child: Center(child:Text('flex2'))),
          Expanded(flex: 1, child: Center(child:Text('flex3'))),
        ],
      ),
      )
    ));
  }
}
