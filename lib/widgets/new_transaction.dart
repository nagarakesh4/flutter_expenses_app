import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _itemNameController = TextEditingController();
  final _itemAmountController = TextEditingController();

  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    void _invokeAddTx() {
      final String inputTitle = _itemNameController.text;
      final inputAmount = double.parse(_itemAmountController.text);

      if (inputTitle.isEmpty || inputAmount < 0 || _selectedDate == null) return;

      widget.addNewTransaction(
        inputTitle,
        inputAmount,
        _selectedDate
      );

      //close the modal sheet
      Navigator.of(context).pop();
    }

    void _displayDatepicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2010, 3, 20),
              lastDate: DateTime.now().add(
                Duration(days: 10),
              ),
              helpText: 'Transaction Date')
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }

        setState(() {
          _selectedDate = pickedDate;
        });
      });
    }

    return Card(
      elevation: 8,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Item Name'),
              controller: _itemNameController,
              onSubmitted: (_) => _invokeAddTx(),
              // onChanged: (value) => itemName = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Item Price'),
              controller: _itemAmountController,
              keyboardType:
                  TextInputType.numberWithOptions(decimal: true, signed: true),
              onSubmitted: (_) => _invokeAddTx(),
              // onChanged: (value) => itemAmount = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date chosen!'
                          : 'Txn Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _displayDatepicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
              ),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _invokeAddTx,
            )
          ],
        ),
      ),
    );
  }
}
