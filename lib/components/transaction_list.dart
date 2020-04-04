import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
   
  final List <Transaction> transactions;
  
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ct, index){
           final tr = transactions[index];

           return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black38,
                        width: 2
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "R\$ ${tr.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        color:Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.black54
                      ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black38,
                          fontSize: 12,
                        ),
                      
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          ),
    );

           
  }
}