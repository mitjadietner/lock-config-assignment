import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/ui/widgets/edit_buttons.dart';
import 'package:locks/ui/widgets/edit_container.dart';

class EditScreen extends StatelessWidget {
  final LockItem item;
  const EditScreen(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 4),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text("This is a short description of a setting."),
                  ),
                ),
                EditContainer(
                    item.secondary.isNotEmpty ? 'Primary' : 'Common', item),
                if (item.secondary.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: EditContainer('Secondary', item),
                  ),
              ],
            ),
          ),
          const EditButtons(),
        ],
      ),
    );
  }
}
