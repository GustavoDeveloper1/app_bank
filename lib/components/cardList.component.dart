import 'package:bank/components/card.component.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final cards;
  final ValueNotifier<Map?> selectedCardNotifier;
  const CardList({super.key, this.cards, required this.selectedCardNotifier});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map?>(
      valueListenable: widget.selectedCardNotifier,
      builder: (context, selectedCard, _) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.cards.length,
          itemBuilder: (context, index) {
            bool isSelected = selectedCard == widget.cards[index];

            return GestureDetector(
              onTap: () {
                widget.selectedCardNotifier.value = widget.cards[index];
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CardComponent(
                  card: widget.cards[index],
                  isSelected: isSelected,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
