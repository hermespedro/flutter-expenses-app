import 'package:flutter/material.dart';

class TransactionsForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function (String, double) onSubmit;

  TransactionsForm(this.onSubmit);
  
  _submitForm (){
    
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return;
    }
    onSubmit(title, value);
                  
  }

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
                   onSubmitted: (_) => _submitForm(),

                   decoration: InputDecoration(
                     labelText: 'Título',
                   ),
                 ),
                TextField(
                  controller: valueController,
                  keyboardType: TextInputType.numberWithOptions(decimal:true),
                  onSubmitted: (_) => _submitForm(),
                  decoration: InputDecoration(
                     labelText: 'Valor (R\$) ',
                   ),
                ),
                FlatButton(
                  onPressed: _submitForm , 
                  color: Colors.black,
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