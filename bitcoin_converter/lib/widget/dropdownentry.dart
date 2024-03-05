import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../service/network.dart';
import '../utilities/const.dart';
late NetworkHelper helper;



DropdownMenu getAndroidEntry() {
  List<DropdownMenuEntry<String>> entries = [];
  for (var entry in kCURRENCIES.entries) {
    entries.add(DropdownMenuEntry(value: entry.key, label: entry.value));
  }
  return DropdownMenu(
    dropdownMenuEntries: entries,
    label: const Text('Currency'),
    onSelected: (value) => {getData('BTC', value)},
  );
}

CupertinoPicker getIOSEntry() {
  List<Text> entries = [];

  for (String entry in kCURRENCIES.values) {
    entries.add(Text(entry));
  }

  return CupertinoPicker(
    itemExtent: 32.0,
    onSelectedItemChanged: (value) {
      List<String> keys = kCURRENCIES.keys.toList();
      print(keys[value]);
    },
    children: entries,
  );
}

Future getData(String crypto, String currency) async {
  helper = NetworkHelper(assetIDBase: crypto, assetIdQuote: currency);
  var data = await helper.getExchangeRate();
  print(data[0].rateVal);
}
