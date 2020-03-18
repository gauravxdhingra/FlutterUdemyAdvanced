import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addtx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker(BuildContext ctx) {
    Platform.isIOS
        ? showModalBottomSheet(
            context: ctx,
            builder: (_) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: CupertinoDatePicker(
                      // minimumDate: DateTime(2019),
                      // maximumDate: DateTime.now(),
                      // initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        setState(() {
                          _selectedDate = dateTime;
                          print(_selectedDate);
                        });
                      },
                    ),
                  ),
                  CupertinoButton(
                    child: Text('Chose Date'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              );
              // CupertinoButton(
              //   child: Text('Chose Date'),
              //   onPressed: () => print(_selectedDate),
              // )
            },
            // child:
          )
        : showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now(),
          ).then(
            (pickedDate) {
              if (pickedDate == null) {
                return;
              }
              setState(() {
                _selectedDate = pickedDate;
              });
            },
          );
    print("...");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          left: 10,
          right: 10,
          top: 10,
        ),
        // margin: EdgeInsets.all(10),
        child: Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                // onChanged: (val) {
                //   titleInput = val;
                // },

                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                // onChanged: (val) {
                //   amountInput = val;
                // },

                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),

                keyboardType: TextInputType.numberWithOptions(),
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Platform.isIOS
                        ? CupertinoButton(
                            onPressed: () => _presentDatePicker(context),
                            child: Text(
                              'Chose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        : FlatButton(
                            onPressed: () => _presentDatePicker(context),
                            child: Text(
                              'Chose Date',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            textColor: Theme.of(context).primaryColor,
                          )
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                child: Text(
                  'Add Transaction',
                ),

                onPressed: _submitData,

                // print(titleInput);
                // print(amountInput);

                // print(_titleController.text);
                // print(_amountController.text);
              )
            ],
          ),
        ),
      ),
    );
  }
}
