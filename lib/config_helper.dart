class ConfigHelper {
  List<String> getKickValues() {
    return ['None', '1', '2', '3', '4', '5'];
  }

  List<String> getRadioValuesFor(int type) {
    switch (type) {
      case 1:
        return ["No Lock", "12V", "24V"];
      case 2:
        return ["Lock with power", "Lock without power"];
      case 4:
        return ["Off", "On"];
      default:
        return [];
    }
  }
}
