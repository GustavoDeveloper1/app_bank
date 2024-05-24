import 'package:bank/models/client.model.dart';
import 'package:flutter/material.dart';

class NavBarComponent extends StatefulWidget {
  final List client;
  NavBarComponent({Key? key, required this.client}) : super(key: key);

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  @override
  Widget build(BuildContext context) {
    print(widget.client);
    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            "Olá, ${widget.client[0]["name"]} ",
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Positioned(
                      right: 7,
                      top: 7,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 13,
                          minHeight: 13,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2890CF),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                        ),
                      ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
