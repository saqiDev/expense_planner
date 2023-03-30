import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enterdTitle = _titleController.text;
    final enterdAmount = double.parse(_amountController.text);
    if (enterdTitle.isEmpty || enterdAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(enterdTitle, enterdAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: _titleController,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Amount",
            ),
            controller: _amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate == null
                    ? "No date choosen!"
                    : "Picked Date:${DateFormat.yMd().format(_selectedDate)}"),
                TextButton(
                  onPressed: _presentDate,
                  child: Text(
                    "Choose Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _submitData,
            child: Text("Add Transaction"),
          ),
        ]),
      ),
    );
  }
}
