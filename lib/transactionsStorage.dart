import 'dart:convert';
import 'dart:io';

import 'package:finances/models/transaction.dart';
import 'package:path_provider/path_provider.dart';

class TransactionsStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/transactions.json');
  }

  Future<List<Transaction>> readTransactions() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(contents);
      List<Transaction> transactions =
          jsonList.map((json) => Transaction.fromJson(json)).toList();
      return transactions;
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }

  Future<File> writeTransactions(List<Transaction> transactions) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(jsonEncode(transactions));
  }
}
