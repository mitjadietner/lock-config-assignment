import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';

class AngleSlider extends StatefulWidget {
  final LockItem item;
  const AngleSlider(this.item, {super.key});

  @override
  State<AngleSlider> createState() => _AngleSliderState();
}

class _AngleSliderState extends State<AngleSlider> {
  double _currentSliderValue = 90;

  @override
  void initState() {
    super.initState();
    //widget.item.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            'Selected angle: $_currentSliderValue°',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 65,
          max: 125,
          divisions: 12,
          onChanged: (value) {
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
