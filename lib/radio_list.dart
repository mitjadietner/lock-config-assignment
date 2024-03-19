import 'package:flutter/material.dart';

class RadioList extends StatefulWidget {
  final List<String> values;
  final String defaultValue;
  const RadioList(this.defaultValue, this.values, {super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  int _selectedValue = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text('No Lock'),
          value: 1,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        RadioListTile(
          title: Text('12V'),
          value: 2,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
        RadioListTile(
          title: Text('24V'),
          value: 3,
          groupValue: _selectedValue,
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}
