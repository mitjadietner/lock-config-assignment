import 'package:flutter/material.dart';
import 'package:locks/config_helper.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/providers/edit_provider.dart';
import 'package:provider/provider.dart';

class EditDropdown extends StatefulWidget {
  final int doorType;
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

    if (widget.doorType == 1) {
      dropdownValue = widget.item.primary;
    } else {
      dropdownValue = widget.item.secondary;
    }
  }

  void setNewValue(String value) {
    if (widget.doorType == 1) {
      Provider.of<EditProvider>(context, listen: false).setPrimaryValue(value);
    } else {
      Provider.of<EditProvider>(context, listen: false)
          .setSecondaryValue(value);
    }
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
            setNewValue(value ?? '');
            setState(() {
              dropdownValue = value ?? '';
            });
          },
          items: ConfigHelper()
              .getKickValues()
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
