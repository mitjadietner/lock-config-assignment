import 'package:flutter/material.dart';

class EditProvider extends ChangeNotifier {
  String _selectedPrimary = "";
  String _selectedSecondary = "";

  String get currentPrimary => _selectedPrimary;
  String get currentSecondary => _selectedSecondary;

  void setPrimaryValue(String newValue) {
    _selectedPrimary = newValue;
  }

  void setSecondaryValue(String newValue) {
    _selectedSecondary = newValue;
  }
}
