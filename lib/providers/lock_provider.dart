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
      LockItem(1, data.lockVoltage, null),
      LockItem(1, data.lockType, null),
      LockItem(1, data.lockKick, null),
      LockItem(1, data.lockRelease, null),
      LockItem(2, null, data.lockReleaseTime),
      LockItem(2, null, data.lockAngle),
    ];
    notifyListeners();
  }
}
