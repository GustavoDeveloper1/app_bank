import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardComponent extends StatefulWidget {
  final Map<String, dynamic> card; // Corrigido aqui
  final bool isSelected;

  const CardComponent({Key? key, required this.card, required this.isSelected})
      : super(key: key);

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  bool hideInfo = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width * .9,
      height: 200,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF2B66BC),
            Color(0xFF132D55),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 218),
                  ),
                ),
                Container(
                  width: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  height: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          hideInfo
                              ? maskNumber(widget.card["number"]!)
                              : formatNumber(widget.card["number"]!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        widget.card["bank"],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      hideInfo = !hideInfo;
                    });
                  },
                  icon: Icon(
                    hideInfo
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Color(0xFF2B66BC),
                    size: 25,
                  ),
                )
              ],
            ),
            Container(
              height: 10,
            ),
            const Divider(
              color: Color.fromARGB(255, 54, 96, 161),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Limite disponível",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        NumberFormat.currency(
                          locale: 'pt_BR',
                          symbol: 'R\$',
                        ).format(double.parse(
                            widget.card["limit"].replaceAll(',', ''))),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Melhor dia de compra",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.card["bestDay"].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

String formatNumber(String number) {
  String formattedNumber = '';
  int length = number.length;

  for (int i = 0; i < length; i++) {
    formattedNumber += number[i];

    if ((i + 1) % 4 == 0 && i != length - 1) {
      formattedNumber += ' ';
    }
  }

  return formattedNumber;
}

String maskNumber(String number) {
  String maskedNumber = '';
  int length = number.length;

  for (int i = 0; i < length; i++) {
    if (i < length - 4) {
      maskedNumber += '•';
    } else {
      maskedNumber += number[i];
    }

    if ((i + 1) % 4 == 0 && i != length - 1) {
      maskedNumber += ' ';
    }
  }

  return maskedNumber;
}
