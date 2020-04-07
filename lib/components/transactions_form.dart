import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionsForm(this.onSubmit);

  @override
  _TransactionsFormState createState() => _TransactionsFormState();
}

class _TransactionsFormState extends State<TransactionsForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.00;

    if (title.isEmpty || value <= 0  || _selectDate == null ) {
      return;
    }
    widget.onSubmit(title, value, _selectDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectDate = pickedDate;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$) ',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
             
                      Expanded(
                        child: Text(
                          _selectDate == null
                              ? "Nenhuma data selecionada! :"
                              : 'Data Selecionada ${DateFormat('dd/MM/y').format(_selectDate)}',
                              style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                  Container(
                    child: FlatButton(
                      onPressed: _showDatePicker,
                      child: Text(" Outra Data",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),),
                      color: Color(0XFF8EE3A2),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: FlatButton(
                padding: EdgeInsetsDirectional.fromSTEB(MediaQuery.of(context).size.width *.30, 0, MediaQuery.of(context).size.width *.30, 0),
                onPressed: _submitForm,
                color: Colors.grey[900],
                child: Text(
                  'Nova Despesa',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
