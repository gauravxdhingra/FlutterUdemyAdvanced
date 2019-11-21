import 'package:app2/Models/Transaction.dart';
import 'package:flutter/material.dart';
import './new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
