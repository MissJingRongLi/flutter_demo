import 'package:flutter/material.dart';
import 'package:state_provider/overlay/overlayDemo.dart';

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

class BuildBdInside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
       new Center(
      child: StreamBuilder<int>(
        stream: counter(), //
        //initialData: ,// a Stream<int> or null
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('没有Stream');
            case ConnectionState.waiting:
              return Text('等待数据...');
            case ConnectionState.active:
              return Container(
                child: Row(
                  children: <Widget>[
                    Text('active: ${snapshot.data}'),
                    RaisedButton(onPressed: (){
                       MyToast.Info(context, msg: '${snapshot.data}');
                    },
                    child: new Text('提示Toast'),
                    )
                  ],
                ),
              );
            case ConnectionState.done:
              return Text('Stream已关闭');
          }
          return null; // unreachable
        },
      ),
    )
    ],);
  }
}
class BuildBd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          new Text('See Below...'),
          BuildBdInside(),
        ],
      )
    );
  }
}