import 'package:finances_app/components/chart.dart';
import 'package:finances_app/components/transactions_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'components/transactions_form.dart';
import 'models/transaction.dart';
import 'dart:math';
import 'components/chart.dart';

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
    Transaction(
      id: 't1',
      title: 'Tênis da Adidas Skateboarding',
      value: 299.76,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Camisa Nike SB',
      value: 120.97,
      date: DateTime.now(),
    ),
   
  ];

  List <Transaction> get _recentTransactions {
    return _transactions.where((tr){
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now().subtract(Duration(days: 4)),
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
            Chart(_recentTransactions),
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
