import 'package:app2/Widgets/user_transactions.dart';
import 'package:flutter/material.dart';

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
  // String titleInput;
  // String amountInput;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Text("Chart"),
                color: Colors.pink,
              ),
              elevation: 5,
            ),

            UserTransactions(),
            // Column(
            //     //children: ,
            //     ),
          ],
        ),
      ),
    );
  }
}
