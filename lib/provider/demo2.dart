import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/provider/demoViewModel.dart';

int tapNum;

class Demo2 extends StatefulWidget {
  @override
  _DemoState2 createState() => _DemoState2();
}

class _DemoState2 extends State<Demo2> {
  @override
  Widget build(BuildContext context) {
    // 使用ChangeNotifierProvider包裹  页面数据没有即时更新
    // Provider小部件不会监听其提供的值的更改
    return ChangeNotifierProvider(
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
                      alignment: Alignment.center,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.red, width: 2)),
                        child: Center(
                          child: Text('${_demoModel.counter}'),
                        ),
                      ),
                    ),
                  );
                },
              ),
              new Container(height: 20),
              Expanded(
                  child: Container(
                height: 30,
                alignment: Alignment.center,
                color: Colors.blueGrey,
                child: buildRowNum(9),
              )),
              new Container(height: 20),
              Consumer<DemoModel>(
                builder: (context, model, child) {
                  return Expanded(
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            model.Increament();
                          },
                          child: Icon(Icons.add),
                        ),
                        FlatButton(
                          child: Icon(Icons.equalizer),
                          onPressed: () {
                            model.getEqument(tapNum: tapNum);
                          },
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}

Widget buildRowNum(int num) {
  List<Widget> widgets = [];
  for (int i = 0; i < num; i++) {
    widgets.add(GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.red, width: 2)),
          child: Center(
            child: Text('$i'),
          ),
        ),
      ),
      onTap: () {
        tapNum = i;
      },
    ));
  }

//重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
  //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
  Widget content = Row(
    children: widgets,
  );
  return content;
}
