import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String currencyCode;
  final String rate;
  const CryptoCard({super.key, required this.currencyCode, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue[400],
      ),
      child: Text(
        '1 $currencyCode = $rate',
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
