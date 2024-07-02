import 'package:flutter/cupertino.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../generated/l10n/l10n.dart';

class Country {
  final String name;
  final String flagImagePath;
  final String dialingCode;

  Country(this.name, this.flagImagePath, this.dialingCode);
}

List<Country> getCountries(BuildContext context) {
  return [
    Country(S.of(context).russia, TImages.russiaFlag, '+7'),
    Country(S.of(context).belarus, TImages.belarusFlag, '+375'),
    Country(S.of(context).kazakhstan, TImages.kazakhstanFlag, '+7'),
    Country(S.of(context).kyrgyzstan, TImages.kyrgyzstanFlag, '+996'),
    Country(S.of(context).armenia, TImages.armeniaFlag, '+374'),
    Country(S.of(context).uzbekistan, TImages.uzbekistanFlag, '+998'),
  ];
}
