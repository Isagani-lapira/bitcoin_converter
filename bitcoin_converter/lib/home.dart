import 'package:bitcoin_converter/utilities/const.dart';
import 'package:bitcoin_converter/widget/dropdownentry.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: kAppTitle),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              children: [],
            ),
          ),
          Container(
            height: 150.0,
            color: Colors.blue[400],
            width: double.infinity,
            child: Center(
              child: (Platform.isIOS) ? getIOSEntry() : getAndroidEntry(),
            ),
          )
        ],
      ),
    );
  }
}
