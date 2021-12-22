import 'package:finances/models/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionsProvider with ChangeNotifier {
  final List<Transaction> _items = [];

  List<Transaction> get items => _items;

  int get totalExpenses {
    return _items.fold(0, (sum, item) {
      if (item.type == TransactionType.Expense) {
        return sum + item.amount;
      } else {
        return sum;
      }
    });
  }

  int get totalIncome {
    return _items.fold(0, (sum, item) {
      if (item.type == TransactionType.Income) {
        return sum + item.amount;
      } else {
        return sum;
      }
    });
  }

  int get total {
    return totalIncome - totalExpenses;
  }

  void addTransaction(Transaction transaction) {
    _items.add(transaction);
    notifyListeners();
  }
}
