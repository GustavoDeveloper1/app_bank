import 'package:bank/models/transactions.model.dart';

class CardModel {
  final int id;
  final String number;
  final String limit;
  final String cvc;
  final String type;
  final String emiter;
  final String bank;
  final int bestDay;
  final List<Transaction> transactions;

  CardModel({
    required this.id,
    required this.number,
    required this.limit,
    required this.cvc,
    required this.type,
    required this.emiter,
    required this.bank,
    required this.bestDay,
    required this.transactions,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    var transactionsList = (json['transactions'] as List)
        .map((transactionJson) => Transaction.fromJson(transactionJson))
        .toList();

    return CardModel(
      id: json['id'],
      number: json['number'],
      limit: json['limit'],
      cvc: json['cvc'],
      type: json['type'],
      emiter: json['emiter'],
      bank: json['bank'],
      bestDay: json['bestDay'],
      transactions: transactionsList,
    );
  }
}
