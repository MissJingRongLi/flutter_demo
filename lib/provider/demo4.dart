import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider/provider/MvvMProvider.dart';

class Demo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(BuildContext context){
        return MvvMProvider(loginService: LoginServive());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('MvvM的Provider'),
        ),
        body: Column(
          children: <Widget>[
            Consumer<MvvMProvider>(builder:(context, model, child ){
              return Column(
                children: <Widget>[
                  Container(child: Text('${model.status}'),),
                  FlatButton(
                    child: Text('登陆'),
                    onPressed: (){model.login('password');},)
                ],
              );
            } ,)
          ],
        ),
      ),
    );
  }
}
