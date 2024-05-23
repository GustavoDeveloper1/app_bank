import 'package:bank/utils/transactions.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  const TransactionCard({super.key, required this.transaction});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    final dateConvert = DateFormat('dd/MM \'às\' HH:mm')
        .format(DateTime.parse(widget.transaction.date.toString()));
    return Container(
      height: 70,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(
                  width: 1, color: Color.fromRGBO(229, 229, 229, 0.7)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(229, 229, 229, 0.2)),
            child: widget.transaction.type == "mobile_buy"
                ? const Icon(
                    Icons.smartphone_rounded,
                    color: Color.fromRGBO(40, 144, 207, 1),
                  )
                : widget.transaction.type == "food"
                    ? const Icon(Icons.restaurant_menu_outlined,
                        color: Color.fromRGBO(40, 144, 207, 1))
                    : widget.transaction.type == "market"
                        ? const Icon(Icons.shopping_cart_outlined,
                            color: Color.fromRGBO(40, 144, 207, 1))
                        : widget.transaction.type == "driver"
                            ? const Icon(Icons.toys_rounded,
                                color: Color.fromRGBO(40, 144, 207, 1))
                            : widget.transaction.type == "gym"
                                ? const Icon(Icons.fitness_center_rounded,
                                    color: Color.fromRGBO(40, 144, 207, 1))
                                : const Icon(Icons.abc),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    widget.transaction.name,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                FittedBox(
                  child: Text(dateConvert),
                )
              ],
            ),
          ),
          Column(children: [
            Text(
                NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(
                  widget.transaction.value,
                ),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w900)),
            widget.transaction.hasParcel
                ? Text("em ${widget.transaction.numberOfInstallments}x")
                : const Text("")
          ])
        ],
      ),
    );
  }
}
