import 'dart:convert';

import 'package:finances/models/transaction.dart';
import 'package:finances/pages/home/quick_stats.dart';
import 'package:finances/providers/transactions_provider.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

String formatDate(int milliseconds) {
  final template = DateFormat('yyyy-MM-dd');
  return template.format(DateTime.fromMillisecondsSinceEpoch(milliseconds));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var transactions = Provider.of<TransactionsProvider>(context);

    // sort transactions.items by .date, and group them by month and day
    final Map<DateTime, List<Transaction>> sortedByDateTransactions =
        transactions.items.fold(
      <DateTime, List<Transaction>>{},
      (Map<DateTime, List<Transaction>> accumulator, Transaction transaction) {
        // Remove time from date
        final key = DateTime(transaction.date.year, transaction.date.month,
            transaction.date.day);
        if (accumulator.containsKey(key)) {
          accumulator[key]!.add(transaction);
        } else {
          accumulator[key] = [transaction];
        }
        return accumulator;
      },
    );

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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Export'),
              onTap: () async {
                if (Platform.isAndroid) {
                  Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                  ].request();
                  var status = statuses[Permission.storage];
                  if (status == PermissionStatus.granted) {
                    File("/sdcard/Download/finances_backup.json")
                        .writeAsString(jsonEncode(transactions.items))
                        .then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Backup created at /sdcard/Download/finances_backup.json"),
                      ));
                    });
                  }
                }

                Navigator.pop(context);
              },
              leading: const Icon(Icons.file_download),
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () => Navigator.popAndPushNamed(context, "/settings"),
              leading: const Icon(Icons.settings),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const QuickStats(),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: sortedByDateTransactions.length,
                itemBuilder: (context, index) {
                  var transactionsList =
                      sortedByDateTransactions.entries.toList()[index];

                  // sort by date in descending order
                  transactionsList.value
                      .sort((a, b) => b.date.compareTo(a.date));

                  return StickyHeader(
                    header: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Text(formatDate(
                            transactionsList.key.millisecondsSinceEpoch))),
                    content: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: transactionsList.value.length,
                      itemBuilder: (context, index) {
                        final el = transactionsList.value[index];

                        return Card(
                          child: PopupMenuButton(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: "delete",
                                child: const Text("Delete"),
                                onTap: () => transactions.delete(el.id),
                              ),
                            ],
                            child: ListTile(
                              leading: Icon(
                                el.type == TransactionType.Expense
                                    ? Icons.trending_down
                                    : Icons.trending_up,
                                color: el.type == TransactionType.Income
                                    ? Colors.green[500]
                                    : Colors.red[500],
                                size: 38,
                              ),
                              title: Text(
                                (el.type == TransactionType.Expense
                                        ? "-"
                                        : "+") +
                                    NumberFormat.currency(symbol: "")
                                        .format(
                                          el.amount,
                                        )
                                        .split(".")[0],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    // contrasting color depending on theme
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                          color: el.type == TransactionType.Income
                              ? Colors.green[100]
                              : Colors.red[100],
                        );
                      },
                    ),
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
