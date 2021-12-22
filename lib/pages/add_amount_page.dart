import 'package:finances/models/transaction.dart';
import 'package:finances/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:provider/provider.dart';

class AddAmountPage extends StatefulWidget {
  const AddAmountPage({Key? key}) : super(key: key);

  @override
  _AddAmountPageState createState() => _AddAmountPageState();
}

class _AddAmountPageState extends State<AddAmountPage> {
  TransactionType _transactionType = TransactionType.Expense;
  final _formKey = GlobalKey<FormState>();

  var amount = "";

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionsProvider>(context);

    submit() {
      if (_formKey.currentState!.validate()) {
        transactions.addTransaction(
          Transaction(
            double.parse(amount),
            DateTime.now(),
            _transactionType,
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Amount'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Amount',
                  ),
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    amount = value;
                  },
                ),
                const SizedBox(height: 16.0),
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: submit, child: const Text('Confirm')),
                )
              ],
            ),
          )),
    );
  }
}
