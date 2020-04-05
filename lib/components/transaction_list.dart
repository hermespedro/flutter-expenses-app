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
      child: transactions.isEmpty ? Column (
     
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Nenhuma Despesa Cadastrada",
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat',
            color: Color(0xffE6E6E6),
            fontWeight: FontWeight.w800
          ),
          
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset('assets/images/bg1.png',
            fit: BoxFit.cover, 
            ),
          ),
        ],
      ): ListView.builder(
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
                        color: Color(0XFF1111111),
                        width: 2
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "R\$ ${tr.value.toStringAsFixed(2)}",
                      style: TextStyle(
                        color:Color(0XFF1111111),
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
                        color: Color(0XFF1111111),
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