import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locks/model/lock_model.dart';

class TimeInput extends StatefulWidget {
  final LockItem item;
  const TimeInput(this.item, {super.key});

  @override
  State<TimeInput> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.item.defaultValue;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            onTapOutside: (event) {
              double value =
                  _controller.text.isEmpty ? 0 : double.parse(_controller.text);
              if (_controller.text.isEmpty) {
                _controller.text = widget.item.defaultValue;
              } else if (value < 0.1) {
                _controller.text = '0.1';
              } else if (value > 120) {
                _controller.text = '120';
              }
            },
            onEditingComplete: () {
              print(_controller.text);
              double value = double.parse(_controller.text);
              if (value < 0.1) {
                _controller.text = '0.1';
              } else if (value > 120) {
                _controller.text = '120';
              }
            },
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
            ],
          ),
        ),
        const Text(
          ' s (between 0.1 and 120 s)',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
