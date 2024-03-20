import 'package:flutter/material.dart';
import 'package:locks/providers/lock_provider.dart';
import 'package:locks/ui/widgets/list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<LockProvider>(context, listen: false).getData();
  }

  void filterResults(String query) {
    Provider.of<LockProvider>(context, listen: false).filterData(query);
  }

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
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: TextField(
              controller: _filterController,
              onChanged: filterResults,
              decoration: const InputDecoration(
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
            child: Consumer<LockProvider>(
              builder: (context, provider, child) {
                var lockData = provider.dataList;
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      ListItem(item: lockData[index]),
                  itemCount: lockData.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
