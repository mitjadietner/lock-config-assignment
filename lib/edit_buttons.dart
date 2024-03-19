import 'package:flutter/material.dart';

class EditButtons extends StatelessWidget {
  const EditButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(200, 48))),
            onPressed: () {},
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(200, 48))),
            onPressed: () {},
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
