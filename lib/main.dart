import 'package:flutter/material.dart';
import 'package:flutter_application/page/app.dart';
import 'package:flutter_application/page/login.dart';
import 'package:flutter_application/page/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
      initialRoute: 'app',
      routes: <String, WidgetBuilder>{
        'app': (BuildContext context) => App(),
        //'login': (BuildContext context) => LoginScreen(),
        //'menu': (BuildContext context) => MyHomePage(title: 'Menu',),
      },
    );
  }
}
