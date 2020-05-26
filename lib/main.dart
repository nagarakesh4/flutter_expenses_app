import './transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: 't0',
      title: 'Croissant',
      amount: 12.99,
      dateTime: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'India Bazaar',
      amount: 32.99,
      dateTime: DateTime.now(),
    )
  ];

  // String itemName;
  // String itemAmount;

  final itemNameController = TextEditingController();
  final itemAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // chart
          Container(
            width: double.infinity,
            child: Card(
              child: Text('chart'),
              color: Colors.grey,
              elevation: 5,
            ),
          ),
          //input - multiple widgets
          Card(
            elevation: 8,
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Item Name'),
                    controller: itemNameController,
                    // onChanged: (value) => itemName = value,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Item Price'),
                    controller: itemAmountController,
                    // onChanged: (value) => itemAmount = value,
                  ),
                  FlatButton(
                    child: Text(
                      'Add Transaction',
                    ),
                    textColor: Colors.blue,
                    onPressed: () => {
                      print(itemNameController.text)
                    },
                  )
                ],
              ),
            ),
          ),
          //transactions
          Column(
            children: transactions.map((tx) {
              return Card(
                elevation: 8,
                margin: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\$${tx.amount.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blue),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat().add_yMMMd().format(tx.dateTime),
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
