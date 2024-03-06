import 'package:bitcoin_converter/utilities/const.dart';
import 'package:flutter/cupertino.dart';

class IOSDropDown extends StatelessWidget {
  const IOSDropDown({super.key, required this.onSelectedItemChanged});
  final Function onSelectedItemChanged;

  List<Text> getIOSEntry() {
    List<Text> entries = [];
    for (String data in kCURRENCIES.values) {
      entries.add(Text(data));
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    List<String> convertedVal = kCURRENCIES.keys.toList();
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) => {
        onSelectedItemChanged(
          convertedVal[value],
        )
      },
      children: getIOSEntry(),
    );
  }
}
