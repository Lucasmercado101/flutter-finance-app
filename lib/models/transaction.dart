enum TransactionType {
  Income,
  Expense,
}

class Transaction {
  final int id;
  final int amount;
  final String date;
  final TransactionType type;

  Transaction(this.id, this.amount, this.date, this.type);
}
