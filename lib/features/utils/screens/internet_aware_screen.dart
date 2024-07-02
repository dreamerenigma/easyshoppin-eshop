import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easyshoppin_eshop/features/utils/screens/no_internet_screen.dart';
import '../../../utils/constants/image_strings.dart';

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
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    // Listen for connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });

    // Check initial connectivity state
    _checkInitialConnectivity();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkInitialConnectivity() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    _updateConnectionStatus(connectivityResult);
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
    return _isConnected
        ? widget.connectedScreen
        : NoInternetScreen(
      image: TImages.noInternetConnection,
      onRetry: _retryConnection,
    );
  }
}
