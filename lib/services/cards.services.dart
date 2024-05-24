import 'dart:convert';

import 'package:bank/models/transactions.model.dart';
import 'package:bank/utils/database/cards.mock.dart';
import 'package:bank/utils/database/transaction.mock.dart';

List<Map<String, dynamic>> getAllCardByClient(int id) {
  List<Map<String, dynamic>> cards =
      List<Map<String, dynamic>>.from(jsonDecode(cardsMock));
  List<Map<String, dynamic>> cardsData = [];

  for (var card in cards) {
    if (card["client_id"] == id) {
      cardsData.add(card);
    }
  }

  print("cards: $cardsData");
  return cardsData;
}

List<Transaction> getAllTransactionsById(int id) {
  List<Map<String, dynamic>> transactions =
      List<Map<String, dynamic>>.from(jsonDecode(transactionsMock));
  List<Transaction> transactionsData = [];

  for (var transaction in transactions) {
    if (transaction["card_id"] == id) {
      transactionsData.add(Transaction.fromJson(transaction));
    }
  }

  return transactionsData;
}
