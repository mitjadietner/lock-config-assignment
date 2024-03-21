import 'package:flutter/material.dart';

class EditButtons extends StatelessWidget {
  final Function saveFunction;
  const EditButtons(this.saveFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(180, 48))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          FilledButton.tonal(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(180, 48))),
            onPressed: () => saveFunction(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
