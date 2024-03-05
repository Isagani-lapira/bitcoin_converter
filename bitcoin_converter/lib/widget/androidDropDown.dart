import 'package:flutter/material.dart';
import '../utilities/const.dart';
import 'dropdownentry.dart';

class AndroidDropDown extends StatelessWidget {
  const AndroidDropDown({super.key, required this.onSelected});

  final Function onSelected;
  List<DropdownMenuEntry> getAndroidEntry() {
    List<DropdownMenuEntry<String>> entries = [];
    for (var entry in kCURRENCIES.entries) {
      entries.add(DropdownMenuEntry(value: entry.key, label: entry.value));
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: getAndroidEntry(),
      label: const Text('Currency'),
      onSelected: (value) => {onSelected(value)},
    );
  }
}
