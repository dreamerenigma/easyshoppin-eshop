import 'package:flutter/material.dart';
import '../../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../shop/screens/home/home.dart';

class VerificationPhoneScreen extends StatelessWidget {
  final TextEditingController _otpController = TextEditingController();
  final AuthenticationRepository _authRepo = AuthenticationRepository.instance;
  final String verificationId;

  VerificationPhoneScreen({super.key, required this.verificationId});

  void _verifyOTP(void Function(String) showFailedVerificationSnackBar, void Function() navigateToHomeScreen) async {
    final otp = _otpController.text;

    try {
      await _authRepo.verifyOTP(otp);
      // Handle successful sign-in (e.g., navigate to the home screen)
      navigateToHomeScreen();
    } catch (e) {
      showFailedVerificationSnackBar('Failed to verify OTP: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Verification Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              decoration: const InputDecoration(
                hintText: 'Enter OTP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _verifyOTP(
                    (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                },
                    () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
