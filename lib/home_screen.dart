import 'package:flutter/material.dart';
import 'package:locks/list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lock Parameters'),
        centerTitle: true,
        shape: const Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search Parameter',
                  border: OutlineInputBorder()),
            ),
          ),
          Container(
            color: Colors.black,
            height: 40,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Text(
                    'Primary',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    'Secondary',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListItem(
                    title: 'Lock Voltage',
                    leftParam: '12V',
                    rightParam: 'No lock'),
                ListItem(
                    title: 'Lock Release Time',
                    leftParam: '0.5s',
                    rightParam: '120s'),
                ListItem(title: 'Lock Angle', leftParam: '90', rightParam: ''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
