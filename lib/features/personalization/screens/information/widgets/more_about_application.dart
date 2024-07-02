import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../generated/version.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../authentication/models/country_model.dart';
import 'device_info_service.dart';

class MoreAboutApplicationScreen extends StatefulWidget {
  const MoreAboutApplicationScreen({super.key});

  @override
  MoreAboutApplicationScreenState createState() => MoreAboutApplicationScreenState();
}

class MoreAboutApplicationScreenState extends State<MoreAboutApplicationScreen> {
  String deviceName = '';
  String osVersion = '';

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  Future<void> getDeviceInfo() async {
    final deviceInfo = await DeviceInfoService.getDeviceInfo();
    setState(() {
      deviceName = deviceInfo['deviceName']!;
      osVersion = deviceInfo['osVersion']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedCountryModel = Provider.of<SelectedCountryModel>(context);
    final selectedCountry = selectedCountryModel.selectedCountry ?? S.of(context).noCountrySelected;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).moreAboutApplication,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
        actions: [
          IconButton(
            icon: const Icon(BootstrapIcons.share_fill),
            onPressed: () {
              shareAppInfo(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  S.of(context).subtitleMoreAboutApplication,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset(
                TImages.darkAppLogo,
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).versionApplication,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      appVersionName,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).modelDevice,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      deviceName,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).osVersion,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      osVersion,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).localCountry,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4.0),
                    Text(selectedCountry),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void shareAppInfo(BuildContext context) {
    final appInfo = 'Easy Shoppin\n'
        'Version: $appVersionName\n'
        'Device: $deviceName\n'
        'OS Version: $osVersion';
    try {
      Share.share(appInfo);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Share failed: ${error.toString()}')),
      );
    }
  }
}
