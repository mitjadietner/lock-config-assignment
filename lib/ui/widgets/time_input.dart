import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/providers/edit_provider.dart';
import 'package:provider/provider.dart';

class TimeInput extends StatefulWidget {
  final int doorType;
  final LockItem item;
  const TimeInput(this.doorType, this.item, {super.key});

  @override
  State<TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.doorType == 1) {
      _controller.text = widget.item.primary;
    } else {
      _controller.text = widget.item.secondary;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setValueInProvider(double value) {
    if (widget.doorType == 1) {
      Provider.of<EditProvider>(context, listen: false)
          .setPrimaryValue(value.toString());
    } else {
      Provider.of<EditProvider>(context, listen: false)
          .setSecondaryValue(value.toString());
    }
  }

  void checkInput(bool editing) {
    if (_controller.text.isEmpty) _controller.text = widget.item.defaultValue;
    double value = double.tryParse(_controller.text) ?? 0;
    if (!editing && value < 0.1) {
      value = 0.1;
      _controller.text = '0.1';
    } else if (value > 120) {
      value = 120;
      _controller.text = '120';
    }
    setValueInProvider(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Enter time: ',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: 75,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            controller: _controller,
            onTap: () => _controller.clear(),
            onTapOutside: (event) => checkInput(false),
            onChanged: (value) => checkInput(true),
            onEditingComplete: () {
              FocusManager.instance.primaryFocus?.unfocus();
              checkInput(false);
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
            ],
          ),
        ),
      ],
    );
  }
}
