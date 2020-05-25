import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('this is first way of having card with width set based on its parent container than its children'),
              color: Colors.grey,
              elevation: 5,
            ),
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Text('this is second way of having card with width set based on its children /container/ rather than /text/ - same result as step 1'),
            ),
            color: Colors.grey,
            elevation: 5,
          ),
          Card(
            child: Text('Transactions'),
          )
        ],
      ),
    );
  }
}
