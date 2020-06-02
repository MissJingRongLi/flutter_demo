import 'package:flutter/material.dart';
import 'package:state_provider/async_ui/builder_bd.dart';

class FutureBd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 路由界面返回 Scaffold为路由的骨架页
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Future Build"),
      ),
      body: new Center(
        child: FutureBuilder<String>(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // 请求已结束
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                // 请求失败，显示错误
                return new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        child: new Text('Stream Builder'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new BuildBd()));
                        }),
                    new Text("Contents: ${snapshot.error}")
                  ],
                );
              } else {
                // 请求成功，显示数据
                return new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new RaisedButton(
                        child: new Text('Stream Builder'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new BuildBd()));
                        }),
                    new Text("Contents: ${snapshot.data}")
                  ],
                );
              }
            } else {
              // 请求未结束，显示loading
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}
