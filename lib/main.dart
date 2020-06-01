import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/list_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.orangeAccent,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String itemName;
  // String itemAmount;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't0',
    //   title: 'Croissant',
    //   amount: 12.99,
    //   dateTime: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'India Bazaar',
    //   amount: 32.99,
    //   dateTime: DateTime.now(),
    // )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      amount: amount,
      dateTime: DateTime.now(),
      id: 't${_userTransactions.length + 1}',
      title: title,
    );

    setState(() {
      //add will only add the new element to the _userTransactions but will not generate a new pointer
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    //context of the function
    //builder is a fn that returns the widget that should be inside the modal
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addNewTransaction: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // chart
            Container(
              width: double.infinity,
              child: Card(
                child: Text('chart'),
                color: Theme.of(context).primaryColorLight,
                elevation: 5,
              ),
            ),
            //user transactions widget to view transactions
            TransactionList(
              transactions: _userTransactions,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
