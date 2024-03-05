import 'package:bitcoin_converter/service/network.dart';
import 'package:bitcoin_converter/utilities/const.dart';
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
  String value = '';
  late NetworkHelper helper;

  Future getData(String crypto, String currency) async {
    helper = NetworkHelper(assetIDBase: crypto, assetIdQuote: currency);
    var data = await helper.getExchangeRate();

    setState(() {
      //display currency and rate
      value = data[0].currency + '/' + data[0].rateVal;
    });
  }

  Widget getMenuPicker() {
    late Widget picker;
    if (Platform.isIOS) {
      picker = IOSDropDown(onSelectedItemChanged: (value) {
        getData('BTC', value);
      });
    } else {
      picker = AndroidDropDown(onSelected: (value) {
        getData('BTC', value);
      });
    }

    return picker;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: kAppTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [Text('1 BTC = $value')],
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
