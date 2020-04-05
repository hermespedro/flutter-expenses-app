import 'package:finances_app/components/transactions_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'components/transactions_form.dart';
import 'models/transaction.dart';
import 'dart:math';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     home: MyHomePage(),
     theme: ThemeData(
       primaryColor: Color(0xff2F2E41),
       fontFamily: 'BreeSerif',
       appBarTheme: AppBarTheme(
         textTheme: ThemeData.light().textTheme.copyWith(
           title: TextStyle(fontFamily: 'Montserrat', 
           fontSize: 16, 
           fontWeight: FontWeight.w700,
           letterSpacing:1,
           ),
         ),
       ),
     ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List <Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Tênis da Adidas Skateboarding',
    //   value: 299.76,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't1',
    //   title: 'Camisa Nike SB',
    //   value: 120.97,
    //   date: DateTime.now(),
    // ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionsForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xffeeeeee),
        title: Text("Despesas Pessoais", 
        style: TextStyle(
          color: Color(0xfff3f3f3),
        ),),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Color(0xfff3f3f3),
                size: 30,
              ),
              onPressed: () => _opentransactionFormModal(context),
              ),
        ],
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
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _opentransactionFormModal(context),
        child: Icon(Icons.add),
        backgroundColor: Color(0XFF8EE3A2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
