import 'package:flutter/material.dart';

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
            padding: EdgeInsets.all(32),
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
                Container(
                  height: 56,
                  child: Text('Item 1'),
                ),
                Container(
                  height: 56,
                  child: Text('Item 2'),
                ),
                Container(
                  height: 56,
                  child: Text('Item 3'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
