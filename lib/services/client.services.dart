import 'dart:convert';

import 'package:bank/utils/database/client.mock.dart';

getClientData(int id) {
  List<Map<String, dynamic>> clients =
      List<Map<String, dynamic>>.from(jsonDecode(clientMock));
  Map<String, dynamic>? clientData;

  for (var client in clients) {
    if (client["id"] == id) {
      clientData = client;
      break;
    }
  }

  return clientData;
}
