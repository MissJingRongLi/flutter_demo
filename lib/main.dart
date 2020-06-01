import 'package:flutter/material.dart';
import 'package:state_provider/secondPage.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/counter.dart';

void main(){
  runApp(

    // 全局注册的数据提供者 ChangeNotifierProvider -- create
     ChangeNotifierProvider(
       create: (context) => new Counter(),
       child: MyApp(),
      )
     );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'First Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
       child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(
              builder:(context, counter, child) => Text('${counter.value}', style: Theme.of(context).textTheme.headline4,), 
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new secondPage()));
              },
              child: new Text('跳转下一页'),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => {
          Provider.of<Counter>(context, listen: false).increment(),
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),  
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
