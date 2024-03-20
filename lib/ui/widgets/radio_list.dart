import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/providers/edit_provider.dart';
import 'package:provider/provider.dart';

class RadioList extends StatefulWidget {
  final int doorType;
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
    if (widget.doorType == 1) {
      selected = widget.item.primary;
    } else {
      selected = widget.item.secondary;
    }
    values = widget.item.arrayData!.values;
    _selectedIndex = values.indexWhere((value) {
      return value == selected;
    });
  }

  void setNewValue(int index) {
    if (values.isEmpty || index >= values.length) return;
    String newValue = values[index];

    if (widget.doorType == 1) {
      Provider.of<EditProvider>(context, listen: false)
          .setPrimaryValue(newValue);
    } else {
      Provider.of<EditProvider>(context, listen: false)
          .setSecondaryValue(newValue);
    }
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
              setNewValue(value ?? 0);
              setState(() {
                _selectedIndex = value ?? 0;
              });
            },
          );
        },
      ),
    );
  }
}
