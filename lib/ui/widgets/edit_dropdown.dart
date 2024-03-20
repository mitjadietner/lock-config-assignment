import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';

class EditDropdown extends StatefulWidget {
  final String doorType;
  final LockItem item;
  const EditDropdown(this.doorType, this.item, {super.key});

  @override
  State<EditDropdown> createState() => _EditDropdownState();
}

class _EditDropdownState extends State<EditDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.item.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Choose Lock Kick: ',
          style: TextStyle(fontSize: 16),
        ),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          underline: Container(
            height: 2,
            color: Colors.blue,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          items: widget.item.arrayData!.values
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
