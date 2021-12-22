// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      json['amount'] as int,
      DateTime.parse(json['date'] as String),
      $enumDecode(_$TransactionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'type': _$TransactionTypeEnumMap[instance.type],
    };

const _$TransactionTypeEnumMap = {
  TransactionType.Income: 'Income',
  TransactionType.Expense: 'Expense',
};
