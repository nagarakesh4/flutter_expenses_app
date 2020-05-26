import 'package:flutter/material.dart';
import './new_transaction.dart';
import './list_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          //input - multiple widgets
          NewTransaction(),
          //transactions list
          TransactionList(),
      ],
    );
  }
}