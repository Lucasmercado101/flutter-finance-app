import 'package:finances/models/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionsProvider with ChangeNotifier {
  final List<Transaction> _items = [];

  List<Transaction> get items => _items;

  void addTransaction(Transaction transaction) {
    _items.add(transaction);
    notifyListeners();
  }
}
