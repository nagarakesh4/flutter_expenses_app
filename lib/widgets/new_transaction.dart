import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final itemNameController = TextEditingController();
  final itemAmountController = TextEditingController();

  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction});

  @override
  Widget build(BuildContext context) {

    void invokeAddTx(){
      final String inputTitle = itemNameController.text;
      final inputAmount = double.parse(itemAmountController.text);

      if(inputTitle.isEmpty || inputAmount < 0)
        return;

      addNewTransaction(
        inputTitle,
        inputAmount,
      );

      //close the modal sheet
      Navigator.of(context).pop(); 
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
              controller: itemNameController,
              onSubmitted: (_) => invokeAddTx(),
              // onChanged: (value) => itemName = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Item Price'),
              controller: itemAmountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
              onSubmitted: (_) => invokeAddTx(),
              // onChanged: (value) => itemAmount = value,
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
              ),
              textColor: Theme.of(context).accentColor,
              onPressed: invokeAddTx,
            )
          ],
        ),
      ),
    );
  }
}
