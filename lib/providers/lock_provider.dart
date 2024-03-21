import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/repository/locks_repository.dart';
import 'package:locks/services/api_service.dart';

class LockProvider with ChangeNotifier {
  List<LockItem> _allItems = [];
  List<LockItem> _lockList = [];

  final LocksRepository _locksRepository = LocksRepository();
  ApiService service = ApiService();

  List<LockItem> get dataList => _lockList;

  // update the item and store the change in the database
  void updateItem(LockItem newItem) {
    _allItems[_allItems
        .indexWhere((lockItem) => lockItem.type == newItem.type)] = newItem;
    _lockList = List.from(_allItems);
    _locksRepository.updateItem(newItem);
    notifyListeners();
  }

  // filter and update the list using query from text field
  void filterData(String q) {
    final input = q.trim().toLowerCase();
    final filtered = _allItems.where((lockItem) {
      String title = lockItem.title.toLowerCase();
      String primary = lockItem.primary.toLowerCase();
      String secondary = lockItem.secondary.toLowerCase();
      return title.contains(input) ||
          primary.contains(input) ||
          secondary.contains(input);
    }).toList();
    if (input.isEmpty) {
      _lockList = List.from(_allItems);
    } else {
      _lockList = List.from(filtered);
    }
    notifyListeners();
  }

  // get data from database or fetch it from API
  void getData() async {
    List<LockItem> storedItems = await _locksRepository.getStoredItems();
    // use stored data if exists
    if (storedItems.isNotEmpty) {
      _allItems = List.from(storedItems);
      _lockList = List.from(storedItems);
      notifyListeners();
      return;
    }
    // fetch data
    LockDoor data = await service.fetchData();
    _allItems = [
      LockItem(
        1,
        "Lock Voltage",
        data.lockVoltage.lockDefault,
        data.lockVoltage.common == null
            ? data.lockVoltage.lockDefault
            : data.lockVoltage.common == true
                ? ""
                : data.lockVoltage.lockDefault,
        data.lockVoltage.lockDefault,
      ),
      LockItem(
        2,
        "Lock Type",
        data.lockType.lockDefault,
        data.lockType.common == null
            ? data.lockType.lockDefault
            : data.lockType.common == true
                ? ""
                : data.lockType.lockDefault,
        data.lockType.lockDefault,
      ),
      LockItem(
        3,
        "Lock Kick",
        data.lockKick.lockDefault,
        data.lockKick.common == null
            ? data.lockKick.lockDefault
            : data.lockKick.common == true
                ? ""
                : data.lockKick.lockDefault,
        data.lockKick.lockDefault,
      ),
      LockItem(
        4,
        "Lock Release",
        data.lockRelease.lockDefault,
        data.lockRelease.common == null
            ? data.lockRelease.lockDefault
            : data.lockRelease.common == true
                ? ""
                : data.lockRelease.lockDefault,
        data.lockRelease.lockDefault,
      ),
      LockItem(
        5,
        "Lock Release Time",
        data.lockReleaseTime.lockDefault.toString(),
        data.lockReleaseTime.common == null
            ? data.lockReleaseTime.lockDefault.toString()
            : data.lockReleaseTime.common == true
                ? ""
                : data.lockReleaseTime.lockDefault.toString(),
        data.lockReleaseTime.lockDefault.toString(),
      ),
      LockItem(
        6,
        "Lock Angle",
        data.lockAngle.lockDefault.toString(),
        data.lockAngle.common == null
            ? data.lockAngle.lockDefault.toString()
            : data.lockAngle.common == true
                ? ""
                : data.lockAngle.lockDefault.toString(),
        data.lockAngle.lockDefault.toString(),
      ),
    ];
    _lockList = List.from(_allItems);
    _locksRepository.insertItems(_allItems);
    notifyListeners();
  }
}
