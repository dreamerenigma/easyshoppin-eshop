import 'package:flutter/material.dart';
import 'dart:async';
import '../../../generated/l10n/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key, required this.image, required this.onRetry});

  final String image;
  final VoidCallback onRetry;

  @override
  NoInternetScreenState createState() => NoInternetScreenState();
}

class NoInternetScreenState extends State<NoInternetScreen> {
  bool _isLoading = false;

  void _handleRetry() {
    setState(() {
      _isLoading = true;
    });

    // Simulate a short delay to create the flicker effect
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        _isLoading = false;
      });

      // Call the onRetry callback after the delay
      widget.onRetry();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: isDarkMode ? TColors.black : TColors.light,
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(textColor),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.4,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                S.of(context).noInternetConnection,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: textColor),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                S.of(context).checkInternetSettings,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.7)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleRetry,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(S.of(context).loadMore),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
