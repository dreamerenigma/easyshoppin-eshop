import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../personalization/controllers/user_controller.dart';
import '../../../../personalization/screens/address/select_address.dart';
import '../../../../personalization/screens/settings/widgets/chats.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easyshoppin_eshop/common/widgets/shimmers/shimmer.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

    return TAppBar(
      customHeight: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.to(() => const SelectAddressScreen());
                  },
                  borderRadius: BorderRadius.circular(8),
                  splashColor: TColors.primary.withOpacity(0.3),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          UniconsLine.location_pin_alt,
                          color: TColors.grey,
                        ),
                        const SizedBox(width: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  S.of(context).selectAddress,
                                  style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white),
                                ),
                                const SizedBox(width: 4),
                                const Icon(
                                  EvaIcons.arrowIosDownwardOutline,
                                  size: 18,
                                  color: TColors.grey,
                                ),
                              ],
                            ),
                            Text(
                              'Ульяновск',
                              style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  BootstrapIcons.chat_right_dots,
                  color: TColors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatsScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).homeAppbarTitle,
            style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              final userFullName = controller.user.value.id.isNotEmpty
                  ? controller.user.value.fullName
                  : S.of(context).guest;
              return SizedBox(
                height: 60,
                child: Text(
                  userFullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
