import 'package:easyshoppin_eshop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:easyshoppin_eshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/colors.dart';
import '../../models/country_model.dart';
import 'package:provider/provider.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  SelectCountryState createState() => SelectCountryState();
}

class SelectCountryState extends State<SelectCountryScreen> {
  String? _selectedCountry;
  String? _focusedCountry;

  void _navigateToMoreAboutApplication(BuildContext context) {
    final selectedCountryModel = Provider.of<SelectedCountryModel>(context, listen: false);
    selectedCountryModel.updateCountry(_selectedCountry!);
    Navigator.pushReplacementNamed(context, '/more_about_application');
  }

  void _navigateToMenu() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Country> countries = [
      Country(S.of(context).russia, TImages.russiaFlag),
      Country(S.of(context).belarus, TImages.belarusFlag),
      Country(S.of(context).kazakhstan, TImages.kazakhstanFlag),
      Country(S.of(context).kyrgyzstan, TImages.kyrgyzstanFlag),
      Country(S.of(context).armenia, TImages.armeniaFlag),
      Country(S.of(context).uzbekistan, TImages.uzbekistanFlag),
    ];

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).selectLanguage,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          radioTheme: RadioThemeData(
            fillColor: WidgetStateProperty.all(TColors.primary),
          ),
        ),
        child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            final country = countries[index];
            final isSelected = country.name == _selectedCountry;
            final isFocused = country.name == _focusedCountry;
            FocusNode focusNode = FocusNode();

            return Focus(
              focusNode: focusNode,
              onFocusChange: (hasFocus) {
                setState(() {
                  _focusedCountry = hasFocus ? country.name : null;
                });
              },
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCountry = country.name;
                  });
                  _navigateToMoreAboutApplication(context);
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected || isFocused
                        ? TColors.buttonSecondary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      country.flag,
                      width: 25,
                      height: 25,
                    ),
                    title: Text(
                      country.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: country.name,
                      groupValue: _selectedCountry,
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value;
                        });
                        _navigateToMenu();
                      },
                    ),
                    onTap: () {
                      setState(() {
                        _selectedCountry = country.name;
                      });
                      _navigateToMenu();
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
