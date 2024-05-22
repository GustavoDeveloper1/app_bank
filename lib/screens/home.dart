import 'dart:convert';

import 'package:bank/components/navbar.component.dart';
import 'package:flutter/material.dart';
import '../utils/database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic> db;
  late Map<String, dynamic> client;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = jsonDecode(dataBaseJson);

    setState(() {
      client = db["client"];
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 33, 84, 167),
                Color(0xFFFFFFFF),
              ],
              stops: [0.0, 0.4512],
            ),
          ),
          child: Column(
            children: [
              NavBarComponent(
                client: client,
              )
            ],
          )),
      loading
          ? Positioned.fill(
              child: Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ))
          : Container()
    ]));
  }
}
