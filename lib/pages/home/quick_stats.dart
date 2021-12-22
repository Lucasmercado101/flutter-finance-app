import 'package:finances/providers/transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const thousand = 1000;
const million = 1000000;
const billion = 1000000000;
const trillion = 1000000000000;
const quadrillion = 1000000000000000;
const quintillion = 1000000000000000000;

String formatCurrency(int value) {
  if (value >= quintillion) {
    return '${(value / quintillion).toStringAsFixed(2)}Q';
  } else if (value >= quadrillion) {
    return '${(value / quadrillion).toStringAsFixed(2)}q';
  } else if (value >= trillion) {
    return '${(value / trillion).toStringAsFixed(0)}t';
  } else if (value >= billion) {
    return '${(value / billion).toStringAsFixed(0)}B';
  } else if (value >= million) {
    return '${(value / million).toStringAsFixed(0)}M';
  } else if (value >= thousand) {
    return '${(value / thousand).toStringAsFixed(0)}K';
  } else {
    return value.toString();
  }
}

class QuickStats extends StatelessWidget {
  const QuickStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var transactions = Provider.of<TransactionsProvider>(context);
    return Container(
      height: 110,
      child: Row(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Income",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      formatCurrency(transactions.totalIncome),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red[500],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Expenses",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      formatCurrency(transactions.totalExpenses),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
                color: Colors.orange[700],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      (transactions.total >= 0 ? "" : "-") +
                          formatCurrency(transactions.total.abs()),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
