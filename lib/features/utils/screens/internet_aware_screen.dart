import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easyshoppin_eshop/features/utils/screens/no_internet_screen.dart';
import '../../../utils/constants/app_images.dart';

class InternetAwareScreen extends StatefulWidget {
  final Widget connectedScreen;
  final String title;

  const InternetAwareScreen({
    super.key,
    required this.connectedScreen,
    required this.title,
  });

  @override
  InternetAwareScreenState createState() => InternetAwareScreenState();
}

class InternetAwareScreenState extends State<InternetAwareScreen> {
  bool _isConnected = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results.isNotEmpty ? results.first : ConnectivityResult.none);
    });

    _checkInitialConnectivity();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkInitialConnectivity() async {
    var connectivityResults = await _connectivity.checkConnectivity();

    _updateConnectionStatus(connectivityResults.isNotEmpty ? connectivityResults.first : ConnectivityResult.none);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  void _retryConnection() {
    _checkInitialConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? widget.connectedScreen : NoInternetScreen(
      image: TImages.noInternetConnection,
      onRetry: _retryConnection,
    );
  }
}
