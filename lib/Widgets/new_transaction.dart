import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addtx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addtx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addtx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              // onChanged: (val) {
              //   titleInput = val;
              // },

              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              // onChanged: (val) {
              //   amountInput = val;
              // },

              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),

              keyboardType: TextInputType.numberWithOptions(),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text(
                'Add Transaction',
              ),
              textColor: Colors.purple,
              onPressed: submitData,

              // print(titleInput);
              // print(amountInput);

              // print(titleController.text);
              // print(amountController.text);
            )
          ],
        ),
      ),
    );
  }
}
