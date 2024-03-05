import 'package:bitcoin_converter/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BitCoin());
}

class BitCoin extends StatelessWidget {
  const BitCoin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
