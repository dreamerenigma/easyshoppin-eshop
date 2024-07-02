import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'dart:io' show Platform;
import 'package:network_info_plus/network_info_plus.dart';

class DeviceInfoService {
  static Future<Map<String, String?>> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String deviceName = '';
    String osVersion = '';
    String? ipAddress;

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        deviceName = '${androidInfo.brand} ${androidInfo.model}';
        osVersion = 'Android ${androidInfo.version.release}';
        ipAddress = await _getAndroidIpAddress();
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceName = '${iosInfo.name} ${iosInfo.model}';
        osVersion = 'iOS ${iosInfo.systemVersion}';
        ipAddress = await _getIOSIpAddress();
      } else if (kIsWeb) {
        final WebBrowserInfo webInfo = await deviceInfoPlugin.webBrowserInfo;
        deviceName = '${webInfo.vendor} ${webInfo.userAgent}';
      } else {
        deviceName = 'Unknown device';
        osVersion = 'Unknown OS';
        ipAddress = null; // No IP address available
      }
    } catch (e) {
      deviceName = 'Error retrieving device info';
      osVersion = 'Error retrieving OS info';
      ipAddress = null;
    }

    return {
      'deviceName': deviceName,
      'osVersion': osVersion,
      'ipAddress': ipAddress,
    };
  }

  static Future<String?> _getAndroidIpAddress() async {
    final logger = Logger();
    try {
      final wifiInfo = NetworkInfo();
      final ipAddress = await wifiInfo.getWifiIP();
      return ipAddress ?? 'Unknown IP';
    } catch (e) {
      logger.d('Error retrieving Android IP: $e');
      return 'Unknown IP';
    }
  }

  static Future<String?> _getIOSIpAddress() async {
    final logger = Logger();
    try {
      final wifiInfo = NetworkInfo();
      final ipAddress = await wifiInfo.getWifiIP();
      return ipAddress ?? 'Unknown IP';
    } catch (e) {
      logger.d('Error retrieving iOS IP: $e');
      return 'Unknown IP';
    }
  }
}
