import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/list_transactions.dart';
import './widgets/chart.dart';

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
        errorColor: Colors.red,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
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

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      //true if happened within last week, else false
      //subtract 7 days from today
      return transaction.dateTime.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTransaction = Transaction(
      amount: amount,
      dateTime: selectedDate,
      id: 't${_userTransactions.length + 1}',
      title: title,
    );

    setState(() {
      //add will only add the new element to the _userTransactions but will not generate a new pointer
      _userTransactions.insert(0, newTransaction);
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

  void _deleteNewTransaction(String id){
    setState((){
      _userTransactions.removeWhere((item) => item.id == id);
    });
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
            Chart(
              recentTransactions: _recentTransactions,
            ),
            //user transactions widget to view transactions
            TransactionList(
              transactions: _userTransactions,
              deleteNewTransaction: _deleteNewTransaction
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
