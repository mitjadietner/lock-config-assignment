import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/ui/screens/edit_screen.dart';

class ListItem extends StatelessWidget {
  final LockItem item;
  const ListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditScreen(item),
            ));
      },
      child: SizedBox(
        height: 72,
        child: Stack(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 72,
                  child: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(item.title),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.primary,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (item.secondary.isNotEmpty) const Spacer(),
                      if (item.secondary.isNotEmpty)
                        Text(
                          item.secondary,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
                Container(
                    color: Colors.grey, height: 1, width: double.infinity),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
