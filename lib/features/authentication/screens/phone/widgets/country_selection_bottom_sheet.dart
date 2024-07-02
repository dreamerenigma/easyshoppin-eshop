import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../data/repositories/country/country.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';

class CountrySelectionBottomSheet {
  static void show(BuildContext context, int selectedCountryIndex, Function(int) onCountrySelected) {
    List<Country> countries = getCountries(context);

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    S.of(context).selectCodeRegion,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.only(right: 28.0),
                  icon: const Icon(Ionicons.close_sharp),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: countries.asMap().entries.map((entry) {
                      int index = entry.key;
                      Country country = entry.value;
                      return InkWell(
                        onTap: () {
                          onCountrySelected(index);
                          Navigator.pop(context); // Close bottom sheet
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      country.flagImagePath,
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${country.name} ${country.dialingCode}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Radio<int>(
                                value: index,
                                groupValue: selectedCountryIndex,
                                onChanged: (value) {
                                  onCountrySelected(value!);
                                  Navigator.pop(context);
                                },
                                activeColor: TColors.primary,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
