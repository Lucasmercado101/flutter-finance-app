import 'package:flutter/material.dart';

class AddAmountPage extends StatefulWidget {
  @override
  _AddAmountPageState createState() => _AddAmountPageState();
}

class _AddAmountPageState extends State<AddAmountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Amount'),
      ),
      body: Center(
        child: Text('Add Amount'),
      ),
    );
  }
}
