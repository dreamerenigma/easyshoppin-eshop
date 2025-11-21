import 'dart:convert';
import 'dart:io';
import 'package:easyshoppin_eshop/features/utils/widgets/no_glow_scroll_behavior.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:easyshoppin_eshop/features/personalization/screens/devices/widgets/device_item.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../models/user_model.dart';
import '../confirm/sms_confirmation_screen.dart';
import '../information/widgets/device_info_service.dart';
import 'package:location/location.dart' as loc;

class DevicesScreen extends StatefulWidget {
  final UserModel user;

  const DevicesScreen({super.key, required this.user});

  @override
  DevicesScreenState createState() => DevicesScreenState();
}

class DevicesScreenState extends State<DevicesScreen> {
  late Future<Map<String, String?>> _deviceInfoFuture;
  String? _appName;
  String _userLocation = 'Loading...';
  String _ipAddress = 'Loading...';
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _deviceInfoFuture = DeviceInfoService.getDeviceInfo();
    _initAppName();
    _getUserLocation();
    _getPublicIP();
  }

  Future<void> _getPublicIP() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org?format=json'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _ipAddress = data['ip'];
        });
      } else {
        setState(() {
          _ipAddress = 'Failed to get IP';
        });
      }
    } catch (e) {
      setState(() {
        _ipAddress = 'Failed to get IP: $e';
      });
    }
  }

  Future<void> _initAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appName = packageInfo.appName;
    });
  }

  Future<void> _getUserLocation() async {
    try {
      if (!Platform.isWindows) {
        loc.Location location = loc.Location();
        bool serviceEnabled;
        loc.PermissionStatus permissionGranted;

        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {
            return;
          }
        }

        permissionGranted = await location.hasPermission();
        if (permissionGranted == loc.PermissionStatus.denied) {
          permissionGranted = await location.requestPermission();
          if (permissionGranted != loc.PermissionStatus.granted) {
            return;
          }
        }

        loc.LocationData locationData = await location.getLocation();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        locationData.latitude ?? 0.0,
        locationData.longitude ?? 0.0
      );
      log('Placemark data: $placemarks');

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;

        setState(() {
          _userLocation = '${placemark.country ?? 'Unknown country'}, ${placemark.locality ?? 'Unknown city'}';
        });
      } else {
        setState(() {
          _userLocation = 'Unknown location';
        });
      }
      } else {
        log("Location not supported on Windows with this plugin.");
      }
    } catch (e) {
      setState(() {
        _userLocation = 'Unknown location';
      });
    }
  }

  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text(S.of(context).yourDevices, style: const TextStyle(fontSize: TSizes.fontSizeXl)), showBackArrow: true),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: RefreshIndicator(
          onRefresh: _reloadData,
          displacement: 0,
          color: TColors.primary,
          backgroundColor: TColors.buttonDarkGrey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 20, right: 20),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child:  Text(S.of(context).subtitleYourDevices, style: Theme.of(context).textTheme.labelMedium),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(context, createPageRoute(SmsConfirmationScreen(user: widget.user)));
                    },
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size.fromHeight(40),
                      side: const BorderSide(color: Colors.blue, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      foregroundColor: TColors.darkerGrey.withAlpha((0.3 * 255).toInt()),
                    ),
                    child: const Text('Подтвердить права на профиль', style: TextStyle(color: TColors.blue, fontSize: TSizes.fontSizeSm)),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Divider(),
                Expanded(
                  child: FutureBuilder<Map<String, String?>>(
                    future: _deviceInfoFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(TColors.primary)));
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Error retrieving device info'));
                      } else {
                        final deviceInfo = snapshot.data!;
                        final deviceType = _determineDeviceType(deviceInfo['deviceName'] ?? '');

                        return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return DeviceItem(
                              session: 'Текущий сеанс',
                              deviceName: deviceInfo['deviceName']!,
                              location: _userLocation,
                              ip: _ipAddress,
                              app: _appName ?? 'Loading...',
                              deviceType: deviceType,
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DeviceType _determineDeviceType(String deviceName) {
    if (deviceName.toLowerCase().contains('iphone') || deviceName.toLowerCase().contains('android')) {
      return DeviceType.smartphone;
    } else {
      return DeviceType.desktop;
    }
  }
}
