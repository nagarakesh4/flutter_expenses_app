import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  //will be sent by external class
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      //for every iteration of list generation, subtract the current index from the current day - basically get last 'index' days
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      //calculate total amount
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        //for the list generation, check if the date of the transaction has happened today, add the sum
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      print('total sum:: $totalSum');
      print('today day:: ${DateFormat.E().format(weekDay)}');

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 8,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            //display chartbar
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPercentTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
