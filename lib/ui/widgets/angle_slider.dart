import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/providers/edit_provider.dart';
import 'package:provider/provider.dart';

class AngleSlider extends StatefulWidget {
  final int doorType;
  final LockItem item;
  const AngleSlider(this.doorType, this.item, {super.key});

  @override
  State<AngleSlider> createState() => _AngleSliderState();
}

class _AngleSliderState extends State<AngleSlider> {
  late double _currentSliderValue;

  @override
  void initState() {
    super.initState();

    if (widget.doorType == 1) {
      _currentSliderValue = double.tryParse(widget.item.primary) ?? 90;
    } else {
      _currentSliderValue = double.tryParse(widget.item.secondary) ?? 90;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            'Selected angle: ${_currentSliderValue.toInt()}°',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 65,
          max: 125,
          divisions: 12,
          onChanged: (value) {
            if (widget.doorType == 1) {
              Provider.of<EditProvider>(context, listen: false)
                  .setPrimaryValue(value.toInt().toString());
            } else {
              Provider.of<EditProvider>(context, listen: false)
                  .setSecondaryValue(value.toInt().toString());
            }
            setState(
              () {
                _currentSliderValue = value;
              },
            );
          },
        ),
      ],
    );
  }
}
