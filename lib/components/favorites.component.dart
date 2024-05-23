// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bank/components/favotiteItem.component.dart';
import 'package:flutter/material.dart';

class FavoritesComponent extends StatefulWidget {
  final favorites;
  const FavoritesComponent({super.key, this.favorites});

  @override
  State<FavoritesComponent> createState() => _FavoritesComponentState();
}

class _FavoritesComponentState extends State<FavoritesComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Meus favoritos",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Personalizar",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.grid_view_outlined,
                    color: Color(0xFF2890CF),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.favorites.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    print(widget.favorites[index]);
                  },
                  child: FavoriteItem(favoriteItem: widget.favorites[index]));
            },
          ),
        )
      ],
    );
  }
}
