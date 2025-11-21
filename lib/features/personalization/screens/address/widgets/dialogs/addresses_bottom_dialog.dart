import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../../data/addresses_data.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/widgets/no_scrollbar_scroll_behavior.dart';
import '../buttons/hover_icon_button.dart';
import '../items/hoverable_list_item.dart';

void showAddressesBottomDialog(BuildContext context) {
  final ScrollController scrollController = ScrollController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: false,
    barrierColor: TColors.transparent,
    backgroundColor: context.isDarkMode ? TColors.dark : TColors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.815,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, right: 14, top: 12, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Все', style: TextStyle(fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.w500, color: context.isDarkMode ? TColors.white : TColors.darkGrey)),
                  HoverIconButton(
                    icon: Ionicons.close_outline,
                    normalColor: context.isDarkMode ? TColors.darkGrey : TColors.darkGrey,
                    hoverColor: context.isDarkMode ? TColors.white : TColors.black,
                    size: 28,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Scrollbar(
                controller: scrollController,
                thickness: 4,
                radius: const Radius.circular(3),
                thumbVisibility: true,
                child: ScrollConfiguration(
                  behavior: NoScrollbarScrollBehavior(),
                  child: ListView.builder(
                    controller: scrollController,
                    primary: false,
                    itemCount: testAddresses.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      final address = testAddresses[index];
                      return HoverableListItem(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 60),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${address.city}, ${address.street} ${address.building}',
                                  style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.darkGrey)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    if (address.isFavorite)
                                      Icon(Icons.star, color: Colors.yellow, size: 16)
                                    else
                                      Icon(Icons.star_border, color: Colors.grey, size: 16),
                                    const SizedBox(width: 4),
                                    Text('${address.rating}', style: const TextStyle(fontSize: 12)),
                                    const SizedBox(width: 6),
                                    Text('${address.deliveryType} · ${address.freeDelivery ? "Бесплатно" : ""}', style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
