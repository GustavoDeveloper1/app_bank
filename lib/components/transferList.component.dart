import 'package:bank/components/transaction.component.dart';
import 'package:bank/utils/transactions.model.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  final List<Transaction> transactions;
  const TransferList({super.key, required this.transactions});

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  Map<String, List<Transaction>> groupTransactionsByDate(
      List<Transaction> transactions) {
    Map<String, List<Transaction>> groupedTransactions = {};
    for (var transaction in transactions) {
      String dateString = formatDate(transaction.date);
      if (groupedTransactions[dateString] == null) {
        groupedTransactions[dateString] = [];
      }
      groupedTransactions[dateString]!.add(transaction);
    }
    return groupedTransactions;
  }

  String formatDate(DateTime date) {
    return "${date.day} ${monthName(date.month)} ${date.year}";
  }

  String monthName(int month) {
    const List<String> months = [
      '',
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    final groupedTransactions = groupTransactionsByDate(widget.transactions);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Últimos lançamentos",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    FittedBox(
                      child: Text(
                        "Ver todos",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 10),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Color.fromRGBO(40, 144, 207, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 10,
          ),
          Container(
            // decoration: BoxDecoration(
            //     border: Border.all(width: 1, color: Colors.black)),
            width: double.infinity,
            height: 200,
            child: ListView(
              shrinkWrap: true,
              children: groupedTransactions.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(40, 144, 207, 1)),
                    ),
                    Column(
                      children: entry.value.map((transaction) {
                        return TransactionCard(transaction: transaction);
                      }).toList(),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
