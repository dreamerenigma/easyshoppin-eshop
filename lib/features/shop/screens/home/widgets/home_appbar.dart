import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../providers/navigation_controller.dart';
import '../../../../../routes/custom_page_route.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_sizes.dart';
import '../../../../personalization/controllers/user_controller.dart';
import '../../../../personalization/screens/address/select_address_screen.dart';
import '../../../../personalization/screens/settings/chats_screen.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import '../../../controllers/chat_controller.dart';
import '../../points/points_screen.dart';

class THomeAppBar extends StatefulWidget {
  const THomeAppBar({super.key});

  @override
  State<THomeAppBar> createState() => _THomeAppBarState();
}

class _THomeAppBarState extends State<THomeAppBar> {
  final UserController controller = Get.find<UserController>();
  final chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      appBarHeight: 100,
      titleSpacing: 0,
      customHeight: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: TColors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const SelectAddressScreen());
                      },
                      splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                      highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(UniconsLine.location_pin_alt, color: TColors.grey),
                            const SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(S.of(context).selectAddress, style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white)),
                                    const SizedBox(width: 4),
                                    const Icon(EvaIcons.arrowIosDownwardOutline, size: 18, color: TColors.grey),
                                  ],
                                ),
                                Text('Ульяновск', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, createPageRoute(const PointsScreen()));
                        },
                        splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                        highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusXl),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          decoration: BoxDecoration(
                            color: TColors.darkerGrey.withAlpha((0.3 * 255).toInt()),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(BootstrapIcons.stars, color: TColors.white, size: 20),
                              const SizedBox(width: 4),
                              Text('50', style: TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, createPageRoute(const ChatsScreen()));
                          chatController.hasNewMessages.value = false;
                        },
                        splashColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                        highlightColor: TColors.darkerGrey.withAlpha((0.4 * 255).toInt()),
                        borderRadius: BorderRadius.circular(TSizes.cardRadiusXl),
                        child: Transform(
                          transform: Matrix4.rotationY(3.14159),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: const Icon(EvaIcons.messageCircleOutline, color: TColors.grey),
                          ),
                        ),
                      ),
                      if (chatController.hasNewMessages.value)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: TColors.red, shape: BoxShape.circle),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildGreetings(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetings(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.windows) {
      return const SizedBox.shrink();
    }

    return Obx(() {
      if (controller.profileLoading.value) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: const TShimmerEffect(width: double.infinity, height: 40),
        );
      } else {
        final userFullName = controller.user.value.id.isNotEmpty ? controller.user.value.firstName : S.of(context).guest;
        final greetingText = S.of(context).haveGoodDay(userFullName);

        return SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
                children: [
                  TextSpan(text: greetingText),
                  TextSpan(
                    text: S.of(context).forShopping,
                    style: TextStyle(color: TColors.accent),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      final navigationController = Get.find<NavigationController>();
                      navigationController.selectedIndex.value = 1;
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
