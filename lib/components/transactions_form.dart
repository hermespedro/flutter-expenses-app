import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function (String, double) onSubmit;

  TransactionsForm(this.onSubmit);
  
  @override
  Widget build(BuildContext context) {
    return Card(
           elevation: 5,
           child: Padding(
             padding: const EdgeInsets.all(10),
             child: Column(
               children: <Widget>[
                 TextField(
                   controller: titleController,
                   decoration: InputDecoration(
                     labelText: 'Título',
                   ),
                 ),
                TextField(
                  controller: valueController,
                  decoration: InputDecoration(
                     labelText: 'Valor (R\$) ',
                   ),
                ),
                FlatButton(
                  onPressed: (){
                    final title = titleController.text;
                    final value = double.tryParse(valueController.text) ?? 0.0;
                    onSubmit(title, value);
                  }, 
                  color: Colors.green
                  ,
                  child: Text(
                    'Adicionar nova despesa',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  
                  ),
                ),
               ],
             ),
           ) ,
         );
  }
}