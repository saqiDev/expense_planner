
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;


  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController=TextEditingController();

  final amountController=TextEditingController();

  void submitData(){
    final enterdTitle=titleController.text;
    final enterdAmount=double.parse(amountController.text);
    if(enterdTitle.isEmpty || enterdAmount<=0){
      return;
    }  
    widget.addTx(enterdTitle, enterdAmount,);

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount",),
                  controller:amountController ,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                  onPressed: submitData,
                  child: Text("Add Transaction"),
                
                ),
              ]),
            ),
          );
  }
}