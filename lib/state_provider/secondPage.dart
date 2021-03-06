import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/async_ui/future_bd.dart';
import 'package:state_provider/overlay/overlayDemo.dart';
import 'package:state_provider/state_provider/counter.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Page"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          new RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
            Navigator.pop(context);
          },
          child: new Text('回到上一页'),
        ),
          new RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new FutureBd()));
          },
          child: new Text('future build'),
        ),
          new RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
            MyToast.Info(context, msg: '第二页Toast');
          },
          child: new Text('测试overlay'),
        ),
        Consumer<Counter>(
              builder:(context, counter, child) => Text('${Counter.value}', style: Theme.of(context).textTheme.headline4,), 
            ),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => {
          Provider.of<Counter>(context, listen: false).sub(),
        },
        tooltip: 'Increment',
        child: Icon(Icons.close),
      ), 
    );
  }
}