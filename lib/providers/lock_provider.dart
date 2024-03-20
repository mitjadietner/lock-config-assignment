import 'package:flutter/material.dart';
import 'package:locks/model/lock_model.dart';
import 'package:locks/services/api_service.dart';

class LockProvider with ChangeNotifier {
  List<LockItem>? _lockList;

  ApiService service = ApiService();

  List<LockItem>? get dataList => _lockList;

  getData() async {
    LockDoor data = await service.fetchData();
    _lockList = [
      LockItem(
        1,
        "Lock Voltage",
        data.lockVoltage.lockDefault,
        data.lockVoltage.common == null
            ? data.lockVoltage.lockDefault
            : data.lockVoltage.common == true
                ? ""
                : data.lockVoltage.lockDefault,
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
        null,
        data.lockAngle,
      ),
    ];
    notifyListeners();
  }
}
