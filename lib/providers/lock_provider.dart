import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/services/api_service.dart';

class LockProvider with ChangeNotifier {
  List<LockItem> _allItems = [];
  List<LockItem> _lockList = [];

  ApiService service = ApiService();

  List<LockItem> get dataList => _lockList;

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

  void getData() async {
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
        data.lockVoltage,
        null,
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
        data.lockType,
        null,
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
        data.lockKick,
        null,
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
        data.lockRelease,
        null,
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
        null,
        data.lockReleaseTime,
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
        null,
        data.lockAngle,
      ),
    ];
    _lockList = List.from(_allItems);
    notifyListeners();
  }
}
