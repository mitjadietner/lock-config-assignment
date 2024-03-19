import 'package:flutter/material.dart';

class EditDropdown extends StatefulWidget {
  final String defaultValue;
  final List<String> options;
  const EditDropdown(this.defaultValue, this.options, {super.key});

  @override
  State<EditDropdown> createState() => _EditDropdownState();
}

class _EditDropdownState extends State<EditDropdown> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.defaultValue;
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
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
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
