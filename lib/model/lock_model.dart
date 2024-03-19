// LockDoor dataFromJson(String str) => LockDoor.fromJson(json.decode(str));
// String dataToJson(LockDoor data) => json.encode(data.toJson());

class LockItem {
  int type;
  LockArray? arrayData;
  LockRange? rangeData;
  LockItem(this.type, this.arrayData, this.rangeData);
}

class LockDoor {
  LockArray lockVoltage; // values, default
  LockArray lockType;
  LockArray lockKick;
  LockArray lockRelease; // values, default, common
  LockRange lockReleaseTime; // range, unit, default
  LockRange lockAngle; // range, unit, default, common

  LockDoor({
    required this.lockVoltage,
    required this.lockType,
    required this.lockKick,
    required this.lockRelease,
    required this.lockReleaseTime,
    required this.lockAngle,
  });

  factory LockDoor.fromJson(Map<String, dynamic> json) => LockDoor(
        lockVoltage: LockArray.fromJson(json["lockVoltage"], "Lock Voltage"),
        lockType: LockArray.fromJson(json["lockType"], "Lock Type"),
        lockKick: LockArray.fromJson(json["lockKick"], "Lock Kick"),
        lockRelease: LockArray.fromJson(json["lockRelease"], "Lock Release"),
        lockReleaseTime:
            LockRange.fromJson(json["lockReleaseTime"], "Lock Release Time"),
        lockAngle: LockRange.fromJson(json["lockAngle"], "Lock Angle"),
      );

  Map<String, dynamic> toJson() => {
        "lockVoltage": lockVoltage.toJson(),
        "lockType": lockType.toJson(),
        "lockKick": lockKick.toJson(),
        "lockRelease": lockRelease.toJson(),
        "lockReleaseTime": lockReleaseTime.toJson(),
        "lockAngle": lockAngle.toJson(),
      };
}

class LockRange {
  String title;
  Range range;
  String unit;
  double lockDefault;
  bool? common;

  LockRange({
    required this.title,
    required this.range,
    required this.unit,
    required this.lockDefault,
    this.common,
  });

  factory LockRange.fromJson(Map<String, dynamic> json, String title) =>
      LockRange(
        title: title,
        range: Range.fromJson(json["range"]),
        unit: json["unit"],
        lockDefault: json["default"]?.toDouble(),
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "range": range.toJson(),
        "unit": unit,
        "default": lockDefault,
        "common": common,
      };
}

class Range {
  double min;
  double max;

  Range({
    required this.min,
    required this.max,
  });

  factory Range.fromJson(Map<String, dynamic> json) => Range(
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}

class LockArray {
  String title;
  List<String> values;
  String lockDefault;
  bool? common;

  LockArray({
    required this.title,
    required this.values,
    required this.lockDefault,
    this.common,
  });

  factory LockArray.fromJson(Map<String, dynamic> json, String title) =>
      LockArray(
        title: title,
        values: List<String>.from(json["values"].map((x) => x)),
        lockDefault: json["default"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "values": List<dynamic>.from(values.map((x) => x)),
        "default": lockDefault,
        "common": common,
      };
}
