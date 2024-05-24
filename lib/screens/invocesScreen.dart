import 'package:flutter/material.dart';

class invoiceScreen extends StatefulWidget {
  const invoiceScreen({super.key});

  @override
  State<invoiceScreen> createState() => _invoiceScreenState();
}

class _invoiceScreenState extends State<invoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF3C6AB2),
          Color(0xFFFFFFFF),
        ],
        stops: [0.0, 0.4512],
      ),
    )));
  }
}
