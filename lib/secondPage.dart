import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/counter.dart';

class secondPage extends StatelessWidget {
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
        Consumer<Counter>(
              builder:(context, counter, child) => Text('${counter.value}', style: Theme.of(context).textTheme.headline4,), 
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