import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {

  

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "t1",
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: 'Weekly Groceries',
      amount: 48.99,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(),
          TransactionList(_userTransactionthi),
    ],);
  }
}