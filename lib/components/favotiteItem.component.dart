import 'package:flutter/material.dart';

class FavoriteItem extends StatefulWidget {
  final favoriteItem;
  const FavoriteItem({super.key, this.favoriteItem});

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: 66,
            height: 66,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(229, 229, 229, 0.2)),
            child: Image.asset(widget.favoriteItem["icon"]),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.favoriteItem["name"],
              style: const TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
