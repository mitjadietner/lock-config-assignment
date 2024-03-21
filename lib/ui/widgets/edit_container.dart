import 'package:flutter/material.dart';
import 'package:locks/ui/widgets/angle_slider.dart';
import 'package:locks/ui/widgets/edit_dropdown.dart';
import 'package:locks/ui/widgets/radio_list.dart';
import 'package:locks/ui/widgets/time_input.dart';

import '../../model/lock_model.dart';

class EditContainer extends StatelessWidget {
  final String doorType;
  final LockItem item;
  const EditContainer(this.doorType, this.item, {super.key});

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
              child:
                  Text('Default value: ${item.defaultValue}${item.getUnit()}'),
            ),
            if (item.type == 1 || item.type == 2 || item.type == 4)
              RadioList(
                  doorType == "Primary" || doorType == "Common" ? 1 : 2, item),
            if (item.type == 6)
              AngleSlider(
                  doorType == "Primary" || doorType == "Common" ? 1 : 2, item),
            if (item.type == 5)
              TimeInput(
                  doorType == "Primary" || doorType == "Common" ? 1 : 2, item),
            if (item.type == 3)
              EditDropdown(
                  doorType == "Primary" || doorType == "Common" ? 1 : 2, item),
          ],
        ),
      ),
    );
  }
}
