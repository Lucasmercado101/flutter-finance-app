import 'package:finances/models/transaction.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";

class AddAmountPage extends StatefulWidget {
  const AddAmountPage({Key? key}) : super(key: key);

  @override
  _AddAmountPageState createState() => _AddAmountPageState();
}

class _AddAmountPageState extends State<AddAmountPage> {
  TransactionType _transactionType = TransactionType.Expense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Amount'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Enter Amount',
              ),
              keyboardType: TextInputType.number,
              autofocus: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(height: 16.0),
            DropdownButton<TransactionType>(
              value: _transactionType,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  _transactionType = newValue!;
                });
              },
              items: const [
                DropdownMenuItem(
                  value: TransactionType.Expense,
                  child: Text('Expense'),
                ),
                DropdownMenuItem(
                  value: TransactionType.Income,
                  child: Text('Income'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
