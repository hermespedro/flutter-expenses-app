import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function (String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Nenhuma Despesa Cadastrada",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Color(0xffE6E6E6),
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  child: Image.asset(
                    'assets/images/bg1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ct, index) {
                final tr = transactions[index];

                return Card(
                  elevation: 0,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xff212121),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text("R\$${tr.value}",
                          style: TextStyle(
                            color:Color(0XFF8EE3A2),
                          ),),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    subtitle: Text(
                      DateFormat(' d MMM y').format(tr.date),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red[400],
                      onPressed: () => onRemove(tr.id),
                      ),
                  ),
                );
              }),
    );
  }
}
