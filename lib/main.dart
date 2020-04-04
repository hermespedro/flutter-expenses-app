import 'package:flutter/material.dart';
import 'components/transactions_user.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas Despesas"),
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('part One'),
                elevation: 3,
              ),
            ),
          TransactionsUser(),
          ],
        ),
      ),
    );
  }
}
