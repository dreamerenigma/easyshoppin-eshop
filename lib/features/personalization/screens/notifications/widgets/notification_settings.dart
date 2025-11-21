import 'package:easyshoppin_eshop/features/personalization/screens/notifications/widgets/sms_toggle.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import 'notification_personal_account_toggle.dart';
import 'notification_toggle.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(S.of(context).settingNotificationTitle, style: const TextStyle(fontSize: TSizes.fontSizeBg)),
        showBackArrow: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              S.of(context).notificationSubscribe,
              style: const TextStyle(fontSize: 14, color: TColors.darkGrey),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light ? TColors.light : TColors.buttonDarkGrey.withAlpha((0.5 * 255).toInt()),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: TColors.black.withAlpha((0.2 * 255).toInt()),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).notificationSms,
                        style: const TextStyle(color: TColors.primary, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).smsMessages,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SmsToggleWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light ? TColors.light : TColors.buttonDarkGrey.withAlpha((0.5 * 255).toInt()),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: TColors.black.withAlpha((0.2 * 255).toInt()),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          S.of(context).notification,
                          style: const TextStyle(color: TColors.primary, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(S.of(context).informationPromotions, style: const TextStyle(fontSize: TSizes.fontSizeMd)),
                      ),
                      NotificationToggle(),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(S.of(context).personalNotifications, style: const TextStyle(fontSize: TSizes.fontSizeMd)),
                      ),
                      NotificationPersonalAccountToggle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
