import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final itemNameController = TextEditingController();
  final itemAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onPressed: () => {print(itemNameController.text)},
            )
          ],
        ),
      ),
    );
  }
}
