import 'package:easyshoppin_eshop/features/personalization/screens/devices/widgets/device_item.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import '../information/widgets/device_info_service.dart';
import 'package:location/location.dart' as loc;

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  DevicesScreenState createState() => DevicesScreenState();
}

class DevicesScreenState extends State<DevicesScreen> {
  late Future<Map<String, String?>> _deviceInfoFuture;
  String? _appName;
  String _userLocation = 'Loading...';
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _deviceInfoFuture = DeviceInfoService.getDeviceInfo();
    _initAppName();
    _getUserLocation();
  }

  Future<void> _initAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appName = packageInfo.appName;
    });
  }

  Future<void> _getUserLocation() async {
    try {
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
    } catch (e) {
      logger.d('Error getting user location: $e');
      setState(() {
        _userLocation = 'Unknown location';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).yourDevices,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 16.0, right: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child:  Text(
                  S.of(context).subtitleYourDevices,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size.fromHeight(40),
                    side: const BorderSide(color: Colors.blue, width: 2),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: const Text('Подтвердить права на профиль', style: TextStyle(color: Colors.blue, fontSize: TSizes.fontSizeSm)),
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(),
              Expanded(
                child: FutureBuilder<Map<String, String?>>(
                  future: _deviceInfoFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
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
                            ip: deviceInfo['ipAddress'] ?? 'Unknown IP',
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
