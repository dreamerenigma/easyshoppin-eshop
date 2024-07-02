import 'package:easyshoppin_eshop/features/authentication/screens/phone/widgets/verification_phone.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import '../../../../../data/repositories/country/country.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../personalization/screens/rules_trading_platform/rules_trading_platform.dart';
import 'country_selection_bottom_sheet.dart';
import 'phone_number_text_input_formatter.dart';

class TPhoneForm extends StatefulWidget {
  const TPhoneForm({super.key});

  @override
  TPhoneFormState createState() => TPhoneFormState();
}

class TPhoneFormState extends State<TPhoneForm> {
  late int _selectedCountryIndex;
  final TextEditingController _phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late List<Country> countries;

  @override
  void initState() {
    super.initState();
    _selectedCountryIndex = 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    countries = getCountries(context);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _sendVerificationCode() async {
    final phoneNumber = _phoneController.text;
    final fullPhoneNumber = "${countries[_selectedCountryIndex].dialingCode}$phoneNumber";

    void showInvalidPhoneNumberSnackBar() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).phoneNumberNotValid)),
      );
    }

    void showFailedVerificationSnackBar(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to verify phone number: $message')),
      );
    }

    void navigateToVerificationScreen(String verificationId) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationPhoneScreen(
            verificationId: verificationId,
          ),
        ),
      );
    }

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: fullPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // Auto-retrieve or instant verification
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            showInvalidPhoneNumberSnackBar();
          } else {
            showFailedVerificationSnackBar(e.message ?? 'Unknown error');
          }
        },
        codeSent: (String verificationId, int? resendToken) {
          navigateToVerificationScreen(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-retrieve timed out
        },
      );
    } catch (e) {
      showFailedVerificationSnackBar(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                S.of(context).enterPhoneNumber,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).loginRegister,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: S.of(context).phoneNumberDigital,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          CountrySelectionBottomSheet.show(
                            context,
                            _selectedCountryIndex,
                                (int newIndex) {
                              setState(() {
                                _selectedCountryIndex = newIndex;
                              });
                            },
                          );
                        },
                        child: Image.asset(
                          countries[_selectedCountryIndex].flagImagePath,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          CountrySelectionBottomSheet.show(
                            context,
                            _selectedCountryIndex,
                                (int newIndex) {
                              setState(() {
                                _selectedCountryIndex = newIndex;
                              });
                            },
                          );
                        },
                        child: const Icon(Typicons.arrow_sorted_down),
                      ),
                    ],
                  ),
                ),
                prefixText: "${countries[_selectedCountryIndex].dialingCode} ",
                // Add a space after the code
                prefixStyle: const TextStyle(color: Colors.white, fontSize: 18),
                // Customize the style as needed
                border: const OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 18),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PhoneNumberTextInputFormatter(),
                LengthLimitingTextInputFormatter(14),
              ],
            ),
            const SizedBox(height: 16),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              onPressed: _sendVerificationCode,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(S.of(context).phoneNumberCode),
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).iAgreeButton,
                  ),
                  TextSpan(
                    text: S.of(context).termsUsePlatform,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => const TRulesTradingPlatformScreen()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
