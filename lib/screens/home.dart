import 'package:bank/components/cardList.component.dart';
import 'package:bank/components/favorites.component.dart';
import 'package:bank/components/navbar.component.dart';
import 'package:bank/components/transferList.component.dart';
import 'package:bank/models/transactions.model.dart';
import 'package:bank/services/cards.services.dart';
import 'package:bank/services/client.services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Map<String, dynamic>> cards = [];
  late List client = [];
  bool loading = true;

  final ValueNotifier<Map<String, dynamic>?> selectedCard =
      ValueNotifier<Map<String, dynamic>?>(null);
  final Map<int, List<Transaction>> transactionsCache = {};

  @override
  void initState() {
    super.initState();
    _getAllData();
  }

  _getAllData() async {
    var clientData = await getClientData(12981);
    var cardsData = await getAllCardByClient(12981);
    client.add(clientData);

    if (cardsData != null && cardsData.isNotEmpty) {
      selectedCard.value = cardsData[0];
    }

    setState(() {
      cards = cardsData;
      loading = false;
    });
  }

  Future<List<Transaction>> _getTransactionsByCardId(int cardId) async {
    if (transactionsCache.containsKey(cardId)) {
      return transactionsCache[cardId]!;
    } else {
      var transactions = await getAllTransactionsById(cardId);
      transactionsCache[cardId] = transactions;
      return transactions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 50,
                  bottom: 20,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 33, 84, 167),
                      Color(0xFFFFFFFF),
                    ],
                    stops: [0.0, 0.58],
                  ),
                ),
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NavBarComponent(client: client),
                        SizedBox(
                          height: orientation == Orientation.portrait
                              ? MediaQuery.of(context).size.height * 0.3
                              : MediaQuery.of(context).size.height * 0.5,
                          child: CardList(
                            cards: cards,
                            selectedCardNotifier: selectedCard,
                          ),
                        ),
                        const Divider(
                            color: Color.fromARGB(255, 253, 253, 253)),
                        const SizedBox(height: 10),
                        FavoritesComponent(favorites: client[0]["favorites"]),
                        const Divider(
                            color: Color.fromRGBO(229, 229, 229, 0.7)),
                        SizedBox(
                          height: 400,
                          child: ValueListenableBuilder<Map<String, dynamic>?>(
                            valueListenable: selectedCard,
                            builder: (ctx, selectedCard, _) {
                              int cardId = selectedCard != null
                                  ? selectedCard["id"]
                                  : -1;
                              return FutureBuilder<List<Transaction>>(
                                future: _getTransactionsByCardId(cardId),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                        child: Text(
                                            "Erro a Pegar as transações!"));
                                  } else {
                                    var transactions = snapshot.data ?? [];
                                    return ListView(
                                      shrinkWrap: true,
                                      children: [
                                        TransferList(
                                            transactions: transactions),
                                      ],
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
    );
  }
}
