import 'package:uuid/uuid.dart';

import 'package:uuid/uuid.dart';

enum TransactionType {
  Income,
  Expense,
}

class Transaction {
  final Uuid id = const Uuid();
  final int amount;
  final DateTime date;
  final TransactionType type;

  Transaction(this.amount, this.date, this.type);
}
