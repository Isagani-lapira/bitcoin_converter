import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilities/const.dart';

DropdownMenu getAndroidEntry() {
  List<DropdownMenuEntry<String>> entries = [];
  for (var entry in kCURRENCIES.entries) {
    entries.add(DropdownMenuEntry(value: entry.key, label: entry.value));
  }
  return DropdownMenu(
    dropdownMenuEntries: entries,
    label: const Text('Currency'),
    onSelected: (value) => {print(value)},
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
