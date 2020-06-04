import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/provider/StatusModel.dart';
import 'package:state_provider/provider/demoViewModel.dart';

enum Status { none, running, stopped, paused }

class Demo3 extends StatefulWidget {
  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiProvider'),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DemoModel()),
          ChangeNotifierProvider(create: (context) => StatusModel())
        ],
        child: Container(
          child: Column(
            children: <Widget>[
              //显示demoModel
              Builder(builder: (context) {
                DemoModel _demoModel = Provider.of<DemoModel>(context);
                return Container(
                  child: Center(
                    child: Text('${_demoModel.counter}'),
                  ),
                );
              }),
              Builder(builder: (context) {
                StatusModel _statusModel = Provider.of<StatusModel>(context);
                return Container(
                  child: Center(
                    child: Text('${_statusModel.status}'),
                  ),
                );
              }),

              Consumer<DemoModel>(builder: (
                context,
                model,
                child,
              ) {
                return FlatButton(
                  onPressed: () {model.Increament();},
                  child: Row(
                    children: <Widget>[Text('DemoModel'), Icon(Icons.add)],
                  ),
                );
              }),
              Consumer<StatusModel>(builder: (
                context,
                model,
                child,
              ) {
                return FlatButton(
                  onPressed: () {model.changeStatus();},
                  child: Row(
                    children: <Widget>[Text('StatusModel'), Icon(Icons.add)],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
