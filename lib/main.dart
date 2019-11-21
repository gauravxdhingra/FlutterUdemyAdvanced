import 'package:app2/Transaction.dart';
import 'package:flutter/material.dart';
import 'Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 50.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Groceries',
      amount: 100,
      date: DateTime.now(),
    )
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Container(
              width: double.infinity,
              child: Text("Chart"),
              color: Colors.deepOrange,
            ),
            elevation: 5,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                color: Colors.blue[200],
                child: Text(tx.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
