import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_list.dart';
import 'transactions_form.dart';
import '../models/transaction.dart';

class TransactionsUser extends StatefulWidget {
  @override
  _TransactionsUserState createState() => _TransactionsUserState();
}

class _TransactionsUserState extends State<TransactionsUser> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Tênis da Adidas Skateboarding',
      value: 299.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Camisa Nike SB',
      value: 120.97,
      date: DateTime.now(),
    ),
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(_transactions),
        TransactionsForm(_addTransaction),
      ],
    );
  }
}
