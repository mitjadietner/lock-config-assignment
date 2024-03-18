import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String leftParam;
  final String rightParam;
  const ListItem(
      {super.key,
      required this.title,
      required this.leftParam,
      required this.rightParam});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                  child: Text(title),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        leftParam,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (rightParam.isNotEmpty) const Spacer(),
                      if (rightParam.isNotEmpty)
                        Text(
                          rightParam,
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
