import 'package:flutter/material.dart';

class Country {
  final String code;
  final String alphaCode;
  final String name;
  final String nativeName;
  final String flag;
  final String currencyCode;
  final String currencyName;

  Country(
    this.code,
    this.alphaCode,
    this.name,
    this.nativeName,
    this.flag,
    this.currencyCode,
    this.currencyName,
  );

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'alphaCode': alphaCode,
      'name': name,
      'nativeName': nativeName,
      'flag': flag,
      'currencyCode': currencyCode,
      'currencyName': currencyName,
    };
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      json['code'] as String? ?? '',
      json['alphaCode'] as String? ?? '',
      json['name'] as String? ?? '',
      json['nativeName'] as String? ?? '',
      json['flag'] as String? ?? '',
      json['currencyCode'] as String? ?? '',
      json['currencyName'] as String? ?? '',
    );
  }
}

class SelectedCountryModel extends ChangeNotifier {
  String? selectedCountry;

  void updateCountry(String country) {
    selectedCountry = country;
    notifyListeners();
  }
}