import 'package:finances/models/transaction.dart';
import 'package:finances/transactionsStorage.dart';
import 'package:flutter/cupertino.dart';

class TransactionsProvider with ChangeNotifier {
  List<Transaction> _items = [];
  final TransactionsStorage _storage = TransactionsStorage();

  TransactionsProvider() {
    _getData();
  }

  _getData() async {
    _items = await _storage.readTransactions();
    notifyListeners();
  }

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
    _storage.writeTransactions(_items);
    notifyListeners();
  }

  delete(String id) {
    _items.removeWhere((item) => item.id == id);
    _storage.writeTransactions(_items);
    notifyListeners();
  }
}
