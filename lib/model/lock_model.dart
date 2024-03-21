class LockItem {
  int type;
  String title;
  String primary;
  String secondary;
  String defaultValue;
  LockItem(
      this.type, this.title, this.primary, this.secondary, this.defaultValue);

  factory LockItem.fromMap(Map<String, dynamic> json) => LockItem(
        json['type'],
        json['title'],
        json['primaryValue'].toString(),
        json['secondaryValue'].toString(),
        json['defaultValue'].toString(),
      );

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'title': title,
      'primaryValue': primary,
      'secondaryValue': secondary,
      'defaultValue': defaultValue,
    };
  }
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
        lockVoltage: LockArray.fromJson(json["lockVoltage"]),
        lockType: LockArray.fromJson(json["lockType"]),
        lockKick: LockArray.fromJson(json["lockKick"]),
        lockRelease: LockArray.fromJson(json["lockRelease"]),
        lockReleaseTime: LockRange.fromJson(json["lockReleaseTime"]),
        lockAngle: LockRange.fromJson(json["lockAngle"]),
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
  Range range;
  String unit;
  double lockDefault;
  bool? common;

  LockRange({
    required this.range,
    required this.unit,
    required this.lockDefault,
    this.common,
  });

  factory LockRange.fromJson(Map<String, dynamic> json) => LockRange(
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
  List<String> values;
  String lockDefault;
  bool? common;

  LockArray({
    required this.values,
    required this.lockDefault,
    this.common,
  });

  factory LockArray.fromJson(Map<String, dynamic> json) => LockArray(
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
