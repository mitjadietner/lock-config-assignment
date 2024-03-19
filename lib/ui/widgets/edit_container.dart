import 'package:flutter/material.dart';
import 'package:locks/ui/widgets/angle_slider.dart';
import 'package:locks/ui/widgets/edit_dropdown.dart';
import 'package:locks/ui/widgets/radio_list.dart';
import 'package:locks/ui/widgets/time_input.dart';

class EditContainer extends StatelessWidget {
  final String doorType;
  final String defaultValue;
  const EditContainer(this.doorType, this.defaultValue, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                doorType,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text('Default value: $defaultValue'),
            ),
            RadioList('No lock', ['No lock', '12V', '24V']),
            AngleSlider(),
            TimeInput('0.5'),
            EditDropdown('None', ['None', '1', '2', '3', '4', '5']),
          ],
        ),
      ),
    );
  }
}
