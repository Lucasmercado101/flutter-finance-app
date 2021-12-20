import 'package:flutter/material.dart';

class AddAmountPage extends StatefulWidget {
  @override
  _AddAmountPageState createState() => _AddAmountPageState();
}

class _AddAmountPageState extends State<AddAmountPage> {
  var amount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Amount'),
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter Amount',
          ),
          keyboardType: TextInputType.number,
          autofocus: true,
          onChanged: (value) {
            amount = double.parse(value);
          },
        ),
      ),
    );
  }
}
