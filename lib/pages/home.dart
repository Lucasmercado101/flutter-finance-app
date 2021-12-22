import 'package:finances/models/transaction.dart';
import 'package:finances/pages/home/quick_stats.dart';
import 'package:finances/providers/transactions_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

String formatDate(int milliseconds) {
  final template = DateFormat('yyyy-MM-dd');
  return template.format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var transactions = Provider.of<TransactionsProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
      ),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            QuickStats(),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.items.length,
                itemBuilder: (context, index) {
                  var item = transactions.items[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        item.type == TransactionType.Expense
                            ? Icons.trending_down
                            : Icons.trending_up,
                        color: item.type == TransactionType.Income
                            ? Colors.green[500]
                            : Colors.red[500],
                        size: 38,
                      ),
                      title: Text(
                        (item.type == TransactionType.Expense ? "-" : "+") +
                            NumberFormat.currency(symbol: "").format(
                              item.amount,
                            ),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      subtitle:
                          Text(formatDate(item.date.millisecondsSinceEpoch)),
                    ),
                    color: item.type == TransactionType.Income
                        ? Colors.green[100]
                        : Colors.red[100],
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
