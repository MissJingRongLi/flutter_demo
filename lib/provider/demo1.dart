import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/provider/demoViewModel.dart';

class Demo1 extends StatefulWidget {
  @override
  _DemoState1 createState() => _DemoState1();
}

class _DemoState1 extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
     // 使用Provider包裹  页面数据没有即时更新
    // Provider小部件不会监听其提供的值的更改
    return Provider(
      // 创建数据源
        create: (_) => DemoModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Demo'),
          ),
          body: new Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  DemoModel _demoModel = Provider.of<DemoModel>(context);
                  return Expanded(
                    child: Container(
                      height: 30,
                      color: Colors.blueGrey,
                      child: Center(
                        child: Text('${_demoModel.counter}'),
                      ),
                    ),
                  );
                },
              ),
              new Container(height: 20),
              Expanded(
                  child: Container(
                height: 30,
                color: Colors.blueGrey,
                child: Center(
                  child: Center(
                    child: Text('0'),
                  ),
                ),
              )),
              new Container(height: 20),
              Consumer<DemoModel>(
                builder: (context, model, child) {
                  return Expanded(
                      child: FlatButton(
                    onPressed: () {
                      model.Increament();
                    },
                    child: Icon(Icons.add),
                  ));
                },
              )
            ],
          ),
        ));
  }
}
