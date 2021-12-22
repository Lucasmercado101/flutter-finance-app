import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

var uuid = const Uuid();

enum TransactionType {
  Income,
  Expense,
}

@JsonSerializable()
class Transaction {
  final String id;
  final int amount;
  final DateTime date;
  final TransactionType type;

  Transaction(this.amount, this.date, this.type) : id = uuid.v4();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
