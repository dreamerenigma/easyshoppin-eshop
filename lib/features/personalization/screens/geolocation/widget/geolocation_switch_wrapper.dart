import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'geolocation_switch.dart';

class GeolocationSwitchWrapper extends StatefulWidget {
  const GeolocationSwitchWrapper({super.key});

  @override
  GeolocationSwitchWrapperState createState() => GeolocationSwitchWrapperState();
}

class GeolocationSwitchWrapperState extends State<GeolocationSwitchWrapper> {
  bool? isEnabled;

  @override
  void initState() {
    super.initState();
    _loadPermissionStatus();
  }

  Future<void> _loadPermissionStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isEnabled = prefs.getBool('geolocation_enabled') ?? false;
    });
  }

  Future<void> _toggleSwitch(bool value) async {
    setState(() {
      isEnabled = value;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('geolocation_enabled', value);
    if (value) {
      _requestPermission(
        isEnabled: isEnabled!,
        setEnabled: (value) {
          setState(() {
            isEnabled = value;
          });
        },
        showSnackBar: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
      );
    }
  }

  Future<void> _requestPermission({
    required bool isEnabled,
    required Function(bool) setEnabled,
    required Function(String) showSnackBar,
  }) async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      showSnackBar('Location permission is required to enable this feature');
      setEnabled(false);
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('geolocation_enabled', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEnabled == null) {
      return const CircularProgressIndicator();
    }
    return GeolocationSwitch(
      isEnabled: isEnabled!,
      onChanged: _toggleSwitch,
    );
  }
}
