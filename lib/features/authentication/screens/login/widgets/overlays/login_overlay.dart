import 'dart:async';
import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../../../api/apis.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';
import '../../../../../../utils/constants/app_vectors.dart';
import '../../../../../shop/screens/home/widgets/inputs/custom_text_field.dart';
import '../../../../../shop/widgets/buttons/social_buttons.dart';
import '../../../../widgets/social_auth/vk_authentication.dart';

Future<void> showLoginOverlay(BuildContext context) async {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItemsDefault),
          child: Center(
            child: SlideTransition(
              position: slideAnimation,
              child: Stack(
                children: [
                  Container(
                    width: 460,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: context.isDarkMode ? TColors.youngNight : Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false, overscroll: false),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: TSizes.defaultSpace),
                            SvgPicture.asset(TVectors.login, width: 160, height: 160),
                            const SizedBox(height: TSizes.spaceBtwItemsDefault),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Войдите, чтобы совершать покупки на EasyShoppin',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: TSizes.fontSizeXl, fontWeight: FontWeight.w400, color: context.isDarkMode ? TColors.white : TColors.black),
                              ),
                            ),
                            const SizedBox(height: TSizes.defaultSpace),
                            CustomTextField(),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            SizedBox(
                              width: double.infinity,
                              height: TSizes.spaceBtwSectionsExpandedGalaxy,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  splashFactory: NoSplash.splashFactory,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ).copyWith(
                                  mouseCursor: WidgetStateProperty.all(SystemMouseCursors.basic),
                                ),
                                child: const Text('Войти', style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400)),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: SocialButton(
                                    assetPath: TVectors.yandexLogo,
                                    onTap: () async {
                                      await APIs.signInWithYandex(onSuccess: () {
                                        closeOverlay();
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: SocialButton(
                                    assetPath: TVectors.vkLogo,
                                    onTap: () async {
                                      try {
                                        final token = await VKAuth.signInWithVK(clientId: '54339278');
                                        if (token != null) {
                                          log('Успешный вход через VK: $token');
                                          Navigator.of(context).pop();
                                        }
                                      } catch (e) {
                                        log('Ошибка VK OAuth: $e');
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(child: SocialButton(assetPath: TVectors.mailLogo, onTap: () {

                                })),
                                const SizedBox(width: 8),
                                Expanded(child: SocialButton(assetPath: TVectors.okLogo, onTap: () {

                                })),
                                const SizedBox(width: 8),
                                Expanded(child: SocialButton(assetPath: TVectors.googleLogo, onTap: () {

                                })),
                              ],
                            ),
                            const SizedBox(height: TSizes.spaceBtwSectionsExpanded),
                            SizedBox(
                              width: double.infinity,
                              height: TSizes.spaceBtwSectionsExpandedGalaxy,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
                                    if (states.contains(WidgetState.hovered)) {
                                      return context.isDarkMode ? TColors.grey : TColors.nightGrey;
                                    }
                                    return context.isDarkMode ? TColors.white : TColors.black;
                                  }),
                                  foregroundColor: WidgetStateProperty.all(context.isDarkMode ? TColors.black : TColors.white),
                                  shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                  side: WidgetStateProperty.all(BorderSide.none),
                                ).copyWith(
                                  mouseCursor: WidgetStateProperty.all(SystemMouseCursors.basic),
                                ),
                                child: Text('Создать аккаунт', style: TextStyle(fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400)),
                              ),
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems),
                            SizedBox(
                              width: double.infinity,
                              height: TSizes.spaceBtwSectionsExpandedGalaxy,
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: TColors.transparent,
                                  foregroundColor: TColors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  splashFactory: NoSplash.splashFactory,
                                ).copyWith(
                                  mouseCursor: WidgetStateProperty.all(SystemMouseCursors.basic),
                                  side: WidgetStateProperty.all(BorderSide.none),
                                ),
                                child: Text('Нужна помощь?', style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black, fontSize: TSizes.fontSizeMd)),
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(fontSize: TSizes.fontSizeLm, color: context.isDarkMode ? TColors.grey : TColors.white),
                                children: [
                                  const TextSpan(
                                    text: 'Используя этот сервис, вы автоматически создаете или используете имеющуюся учетную запись на EasyShoppin, соглашаетесь на обработку персональных данных согласно ',
                                    style: TextStyle(color: TColors.steelGrey, fontSize: TSizes.fontSizeLm),
                                  ),
                                  TextSpan(
                                    text: 'Политике конфиденциальности',
                                    style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black, decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      log('Нажата Политика конфиденциальности');
                                    },
                                  ),
                                  const TextSpan(text: ' и принимаете условия '),
                                  TextSpan(
                                    text: 'Пользовательских соглашений EasyShoppin',
                                    style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black, decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      log('Нажаты Пользовательские соглашения');
                                    },
                                  ),
                                  const TextSpan(text: '. '),
                                  TextSpan(
                                    text: 'Подробнее',
                                    style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black, decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      log('Нажат Подробнее');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: closeOverlay,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(color: context.isDarkMode ? TColors.cardColor : Colors.grey[300], shape: BoxShape.circle),
                        child: const Icon(Icons.close, size: 14),
                      ),
                    ),
                  ),
                ],
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
