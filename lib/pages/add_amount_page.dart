import 'package:flutter/material.dart';
import "package:flutter/services.dart";

class AddAmountPage extends StatefulWidget {
  const AddAmountPage({Key? key}) : super(key: key);

  @override
  _AddAmountPageState createState() => _AddAmountPageState();
}

class _AddAmountPageState extends State<AddAmountPage> {
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
          ],
        ),
      ),
    );
  }
}
