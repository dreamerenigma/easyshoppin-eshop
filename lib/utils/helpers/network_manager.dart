import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../popups/loaders.dart';

/// Manages the network connectivity status and provides methods to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatusFromList);
  }

  /// Update the connection status from the list
  void _updateConnectionStatusFromList(List<ConnectivityResult> results) {
    if (results.isNotEmpty) {
      _updateConnectionStatus(results.first);
    } else {
      _updateConnectionStatus(ConnectivityResult.none);
    }
  }

  /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'No internet Connection');
    }
  }

  /// Check the internet connection status.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final results = await _connectivity.checkConnectivity();

      return !results.contains(ConnectivityResult.none);

    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
