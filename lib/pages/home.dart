import 'package:finances/models/transaction.dart';
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
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(7),
                      ),
                      color: Colors.green[500],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Income",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "\$" + transactions.totalIcome.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(7),
                      ),
                      color: Colors.red[500],
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Expenses",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "\$" + transactions.totalExpenses.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
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
                            item.amount.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
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
