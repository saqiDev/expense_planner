import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction();

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController=TextEditingController();
  final amountController=TextEditingController();
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
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount",),
                  controller:amountController ,
                ),
                TextButton(
                  onPressed: () {
                    print(titleController.text);
                  },
                  child: Text("Add Transaction"),
                
                ),
              ]),
            ),
          );
  }
}