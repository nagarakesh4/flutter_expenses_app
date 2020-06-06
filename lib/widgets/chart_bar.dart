import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //add variables to be used in this widget
  final String label;
  final double spendingAmount;
  final double spendingPercentTotal;

  ChartBar({this.label, this.spendingAmount, this.spendingPercentTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //amount
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        //empty space
        SizedBox(
          height: 4,
        ),
        //bar
        Container(
          height: 60,
          width: 10,
          //child is background fraction color
          child: Stack(
            children: <Widget>[
              //bottom container
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              //overlay container
              FractionallySizedBox(
                heightFactor: spendingPercentTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        //empty space
        SizedBox(
          height: 4,
        ),
        //label
        Text(
          label,
        ),
      ],
    );
  }
}
