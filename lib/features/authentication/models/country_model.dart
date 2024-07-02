import 'package:flutter/cupertino.dart';

class Country {
  final String name;
  final String flag;

  Country(this.name, this.flag);
}

class SelectedCountryModel extends ChangeNotifier {
  String? selectedCountry;

  void updateCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }
}