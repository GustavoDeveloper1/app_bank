import 'package:bank/components/card.component.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  final List<Map<String, dynamic>> cards;
  final ValueNotifier<Map<String, dynamic>?> selectedCardNotifier;

  const CardList({
    Key? key,
    required this.cards,
    required this.selectedCardNotifier,
  }) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Listen to selectedCardNotifier to update the page controller
    widget.selectedCardNotifier.addListener(_onSelectedCardChanged);
  }

  @override
  void dispose() {
    widget.selectedCardNotifier.removeListener(_onSelectedCardChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onSelectedCardChanged() {
    final selectedCard = widget.selectedCardNotifier.value;
    if (selectedCard != null) {
      final index = widget.cards.indexOf(selectedCard);
      if (index != -1 && index != _pageController.page?.round()) {
        _pageController.jumpToPage(index);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, dynamic>?>(
      valueListenable: widget.selectedCardNotifier,
      builder: (context, selectedCard, _) {
        return PageView.builder(
          controller: _pageController,
          itemCount: widget.cards.length,
          onPageChanged: (index) {
            widget.selectedCardNotifier.value = widget.cards[index];
          },
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
