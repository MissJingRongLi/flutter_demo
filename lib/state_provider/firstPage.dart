import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/flex/flex.dart';
import 'package:state_provider/overlay/overlayDemo.dart';
import 'package:state_provider/state_provider/secondPage.dart';
import 'package:state_provider/state_provider/counter.dart';
import 'package:state_provider/toastDemo/toastDiy.dart';


class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

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
              builder:(context, counter, child) {
                print('Consumer counter hashcode: ${counter.hashCode}');
                return Text('${Counter.value}', style: Theme.of(context).textTheme.headline4,);
              }, 
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondPage()));
              },
              child: new Text('跳转下一页'),
              ),
            RaisedButton(
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new FlexLayout()));
              },
              child: new Text('测试flex布局'),
              ),
            Row(children: <Widget>[
              RaisedButton(
              onPressed: (){
                MyToast.Info(context, msg: '第一个Toast');
              },
              child: new Text('Toast1'),
              ),
              RaisedButton(
              onPressed: (){
                MyToast.Info(context, msg: '第二个Toast');
              },
              child: new Text('Toast2'),
              ),
              RaisedButton(
              onPressed: (){
                MyToast.Info(context, msg: '第三个Toast');
              },
              child: new Text('Toast3'),
              ),
            ],)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          // Counter counter = Provider.of<Counter>(context, listen: false);
          // MyApp.counter.increment();
          Provider.of<Counter>(context, listen: false).increment();
          // print('onPressed counter hashcode: ${counter.hashCode}');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),  
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
