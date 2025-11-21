import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../../../../../utils/constants/app_vectors.dart';
import '../../../../../personalization/screens/address/widgets/buttons/hover_icon_button.dart';
import '../../../../widgets/accordions/cashback_info_accordion.dart';
import '../tooltips/custom_hover_tooltip.dart';

Future<void> showCashbackOverlay(BuildContext context) async {
  final completer = Completer<void>();
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;
  final animationController = AnimationController(vsync: Navigator.of(context), duration: const Duration(milliseconds: 300));
  final slideAnimation = Tween<Offset>(begin: const Offset(0, -0.2), end: Offset.zero).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));

  void closeOverlay() {
    animationController.reverse().then((_) {
      overlayEntry.remove();
      animationController.dispose();
      completer.complete();
    });
  }

  overlayEntry = OverlayEntry(
    builder: (context) {
      return Material(
        color: TColors.black.withAlpha((0.5 * 255).toInt()),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: closeOverlay,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItemsDefault),
            child: Center(
              child: SlideTransition(
                position: slideAnimation,
                child: GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Material(
                      color: TColors.transparent,
                      child: Container(
                        width: 460,
                        decoration: BoxDecoration(color: context.isDarkMode ? TColors.youngNight : TColors.white, borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: TColors.mildNight, borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text("Кэшбэк", style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400, color: context.isDarkMode ? TColors.white : TColors.black)),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("0", style: TextStyle(fontSize: TSizes.fontSizeUn, fontWeight: FontWeight.w500, color: context.isDarkMode ? TColors.white : TColors.black)),
                                            const SizedBox(width: 8),
                                            Transform(
                                              alignment: Alignment.center,
                                              transform: Matrix4.rotationY(math.pi),
                                              child: SvgPicture.asset(TVectors.cashback, width: 24, height: 24),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("1 ягодка = 1 рубль", style: TextStyle(color: context.isDarkMode ? TColors.darkGrey : TColors.grey, fontSize: TSizes.fontSizeSm)),
                                            SizedBox(width: 6),
                                            CustomHoverTooltip(
                                              message: 'Используйте ягодки при оплате заказов. \nЯгодки дают скидку: 1 ягодка = 1 ₽',
                                              offsetX: -145,
                                              offsetY: -10,
                                              showTriangle: false,
                                              child: Icon(Icons.info_outlined, color: TColors.darkGrey, size: 20),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Flexible(
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false, overscroll: false),
                                    child: SingleChildScrollView(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(color: TColors.mildNight, borderRadius: BorderRadius.circular(20)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 30, right: 30, top: 18, bottom: 38),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text('Отвечаем на вопросы', style: TextStyle(fontSize: TSizes.fontSizeBg, fontWeight: FontWeight.w500)),
                                              ),
                                              SizedBox(height: TSizes.spaceBtwItemsSmall),
                                              CashbackInfoAccordion(),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: TColors.mildNight, borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30, right: 30, top: 18, bottom: 38),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          splashFactory: NoSplash.splashFactory,
                                          padding: const EdgeInsets.symmetric(vertical: 24),
                                          backgroundColor: TColors.blue,
                                          shadowColor: TColors.black,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          side: BorderSide.none,
                                        ),
                                        child: Text("Подробнее", style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: closeOverlay,
                                child: HoverIconButton(
                                  icon: Ionicons.close_outline,
                                  normalColor: context.isDarkMode ? TColors.darkGrey : TColors.darkGrey,
                                  hoverColor: context.isDarkMode ? TColors.white : TColors.black,
                                  size: 28,
                                  onPressed: closeOverlay,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  overlay.insert(overlayEntry);
  animationController.forward();

  return completer.future;
}
