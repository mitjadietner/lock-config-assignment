import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';

class RadioList extends StatefulWidget {
  final String doorType;
  final LockItem item;
  const RadioList(this.doorType, this.item, {super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  int _selectedIndex = 0;
  List<String> values = [];

  @override
  void initState() {
    super.initState();
    String selected;
    if (widget.doorType == "Primary" || widget.doorType == "Common") {
      selected = widget.item.primary;
    } else {
      selected = widget.item.secondary;
    }
    values = widget.item.arrayData!.values;
    _selectedIndex = values.indexWhere((value) {
      return value == selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        values.length,
        (index) {
          return RadioListTile(
            title: Text(values[index]),
            value: index,
            groupValue: _selectedIndex,
            onChanged: (value) {
              setState(() {
                _selectedIndex = value!;
              });
            },
          );
        },
      ),
    );
  }
}
