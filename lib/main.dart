import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  void _addNewTransaction(String txTitle, double txAmount)
  {
    final newTx=Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });

  }



  
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(_addNewTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [IconButton(onPressed: () => _startAddNewTransaction(context), icon: Icon(Icons.add),),],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransaction),
            
          ],),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () => _startAddNewTransaction(context),child: Icon(Icons.add),),);
  }
}
