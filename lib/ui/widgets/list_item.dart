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
                  child: Text(item.type == 1
                      ? item.arrayData!.title
                      : item.rangeData!.title),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.type == 1
                            ? item.arrayData!.lockDefault
                            : item.rangeData!.lockDefault.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (item.type == 1
                          ? item.arrayData!.common == null
                          : item.rangeData!.common == null)
                        const Spacer(),
                      if (item.type == 1
                          ? item.arrayData!.common == null
                          : item.rangeData!.common == null)
                        Text(
                          item.type == 1
                              ? item.arrayData!.lockDefault
                              : item.rangeData!.lockDefault.toString(),
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
