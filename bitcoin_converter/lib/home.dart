import 'package:bitcoin_converter/service/network.dart';
import 'package:bitcoin_converter/utilities/const.dart';
import 'package:bitcoin_converter/widget/CryptoCard.dart';
import 'package:bitcoin_converter/widget/androidDropDown.dart';
import 'package:bitcoin_converter/widget/iosDropDown.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedCurrency = '';
  late NetworkHelper helper;
  late Map<String, String> rates = {};
  Future getData(String crypto, String currency) async {
    helper = NetworkHelper(assetIDBase: crypto, assetIdQuote: currency);
    var data = await helper.getExchangeRate();

    setState(() {
      //display currency and rate
      rates[crypto] = data[0].rateVal ?? '0';
    });
  }

  Widget getMenuPicker() {
    late Widget picker;
    if (Platform.isIOS) {
      picker = IOSDropDown(onSelectedItemChanged: (value) {
        selectedCurrency = value;
        for (String crypto in kCryptoList) {
          getData(crypto, selectedCurrency);
        }
      });
    } else {
      picker = AndroidDropDown(onSelected: (value) {
        selectedCurrency = value;
        for (String crypto in kCryptoList) {
          getData(crypto, selectedCurrency);
        }
      });
    }

    return picker;
  }

  List<Widget> card() {
    List<Widget> card = [];
    for (String crypto in kCryptoList) {
      String rate = rates[crypto] ?? '0';
      card.add(
        CryptoCard(currencyCode: crypto, rate: '$rate / $selectedCurrency'),
      );
    }

    return card;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: kAppTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: card(),
              ),
            ),
          ),
          Container(
            height: 150.0,
            color: Colors.blue[400],
            width: double.infinity,
            child: Center(
              child: getMenuPicker(),
            ),
          )
        ],
      ),
    );
  }
}
