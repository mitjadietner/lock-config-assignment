import 'package:locks/repository/db_helper.dart';
import 'package:locks/model/lock_model.dart';

class LocksRepository {
  Future<List<LockItem>> getStoredItems() async {
    final dbHelper = DatabaseHelper.instance;
    final locks = await dbHelper.queryItems();
    return locks;
  }

  void updateItem(LockItem item) async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.update(item);
  }

  void _insertItem(LockItem item) async {
    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insert(item);
  }

  void insertItems(List<LockItem> items) {
    for (var item in items) {
      _insertItem(item);
    }
  }
}
