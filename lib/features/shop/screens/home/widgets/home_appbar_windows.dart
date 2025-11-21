import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/settings/profile_screen.dart';
import 'package:easyshoppin_eshop/features/shop/screens/cart/cart_screen.dart';
import 'package:easyshoppin_eshop/routes/custom_page_route.dart';
import 'package:easyshoppin_eshop/utils/constants/app_images.dart';
import 'package:easyshoppin_eshop/utils/constants/app_sizes.dart';
import 'package:easyshoppin_eshop/utils/platforms/platform_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/app_vectors.dart';
import '../../../../authentication/controllers/auth_controller.dart';
import '../../../../authentication/screens/login/login_screen.dart';
import '../../../../authentication/screens/login/widgets/overlays/login_overlay.dart';
import '../../../../personalization/screens/address/addresses_screen.dart';
import '../../../widgets/items/hoverable_item.dart';
import '../../favorite_stores/favorite_stores_screen.dart';
import '../../order/order_screen.dart';
import 'package:get/get.dart';
import '../home_screen.dart';
import 'dialogs/cashback_overlay.dart';
import 'dialogs/currency_overlay.dart';
import 'tooltips/custom_hover_tooltip.dart';
import 'icons/custom_icon_button.dart';

class THomeAppBarWindows extends StatefulWidget {
  final ValueChanged<bool>? onIsNarrowChanged;

  const THomeAppBarWindows({super.key, this.onIsNarrowChanged});

  @override
  State<THomeAppBarWindows> createState() => _THomeAppBarWindowsState();
}

class _THomeAppBarWindowsState extends State<THomeAppBarWindows> {
  late List<GlobalKey> moneyItemKeys;
  final authController = Get.put(AuthController());
  bool isHover = false;
  bool isHoverItems = false;
  final bool isLoggedIn = false;
  final hoveredIndex = (-1).obs;
  final List<Map<String, String>> menuItems = [
    {"text": "Wibes", "route": "/wibes"},
    {"text": "Отели", "route": "/hotels"},
    {"text": "Авиабилеты", "route": "/air-tickets"},
    {"text": "Туры с ", "route": "/tours"},
    {"text": "Ресейл", "route": "/resale"},
    {"text": "ES Клуб", "route": "/club"},
    {"text": "Бренды", "route": "/brands"},
    {"text": "Новостройки", "route": "/new-buildings"},
    {"text": "Для бизнеса", "route": "/for-business"},
    {"text": "Работа в ES", "route": "/Working"},
  ];
  final List<Map<String, dynamic>> items = [
    {'icon': TeenyIcons.box, 'text': 'Заказы'},
    {'icon': Icons.favorite, 'text': 'Избранное'},
    {'icon': BootstrapIcons.person_fill, 'text': 'Профиль'},
    {'icon': BoxIcons.bxs_cart, 'text': 'Корзина'},
  ];
  late final List<Map<String, Object?>> itemsMoney = [
    {'icon': TVectors.star, 'text': authController.isLoggedIn.value ? '0' : 'КЭШБЭК'},
    {'icon': null, 'text': '0 ₽'},
    {'icon': TVectors.rus, 'text': 'RUB'},
  ];

  @override
  void initState() {
    super.initState();
    moneyItemKeys = List.generate(itemsMoney.length, (_) => GlobalKey());
  }

  @override
  void didUpdateWidget(covariant THomeAppBarWindows oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (moneyItemKeys.length != itemsMoney.length) {
      moneyItemKeys = List.generate(itemsMoney.length, (_) => GlobalKey());
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isNarrow = width < 1040;

        return Container(
          color: TColors.purple,
          height: !isNarrow ? 125 : 100,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1450),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: !isNarrow ? 20 : 0, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!isNarrow)
                          MouseRegion(
                            onEnter: (_) => setState(() => isHover = true),
                            onExit: (_) => setState(() => isHover = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                              decoration: BoxDecoration(
                                color: isHover ? TColors.textPurple.withAlpha((0.4 * 255).toInt()) : TColors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Ionicons.location_sharp, size: 17, color: TColors.textPurple),
                                  const SizedBox(width: 4),
                                  Text('г Ульяновск, Отрадная Улица 14к2', style: TextStyle(color: isHover ? TColors.white : TColors.textPurple, fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Obx(() {
                              return Row(
                                children: List.generate(menuItems.length, (index) {
                                  final item = menuItems[index];
                                  final isHovered = hoveredIndex.value == index;

                                  return MouseRegion(
                                    onEnter: (_) => hoveredIndex.value = index,
                                    onExit: (_) => hoveredIndex.value = -1,
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(item["route"]!);
                                      },
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 150),
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: isHovered ? TColors.white.withAlpha((0.15 * 255).toInt()) : TColors.transparent,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              item["text"]!,
                                              style: const TextStyle(
                                                color: TColors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            if (item["text"] == 'Туры с') ...[
                                              const SizedBox(width: 4),
                                              Image.asset(TImages.funSun, width: 22, height: 22),
                                            ],
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 4),
                        buildMoneyItemsRow(isNarrow, isLoggedIn, itemsMoney),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (!isNarrow)
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, createPageRouteNoAnimation(const HomeScreen()));
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Image.asset(TImages.appLogoLight, width: 65, height: 65),
                                Positioned(
                                  left: 55,
                                  top: 0,
                                  child: Transform.rotate(
                                    angle: -0.1,
                                    child: Image.asset(TImages.blackFridayLogo, width: 120, height: 65),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (!isNarrow) const SizedBox(width: 140),
                        if (!isNarrow) CustomIconButton(),
                        SizedBox(width: !isNarrow ? 12 : 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Найти на EasyShoppin',
                              hintStyle: TextStyle(color: TColors.darkGrey, fontWeight: FontWeight.w400, fontSize: !isNarrow ? TSizes.fontSizeLg : TSizes.fontSizeMd, fontFamily: 'Roboto'),
                              suffixIcon: CustomHoverTooltip(
                                message: 'Найти товары по фото',
                                offsetX: -95,
                                offsetY: -5,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(Icons.camera_alt_rounded, size: !isNarrow ? 30 : 26),
                                ),
                              ),
                              filled: true,
                              fillColor: TColors.white,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none,),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: !isNarrow ? 20 : 8),
                            ),
                            style: TextStyle(color: context.isDarkMode ? TColors.black : TColors.white, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(width: 8),
                        buildHoverableItems(isNarrow),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget buildMoneyItemsRow(bool isNarrow, bool isLoggedIn, List<Map<String, dynamic>> itemsMoney) {
    if (isNarrow) return const SizedBox.shrink();

    return Row(
      children: List.generate(
        itemsMoney.length, (index) {
          if (!isLoggedIn && index == 1) return const SizedBox();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  showCashbackOverlay(context);
                } else if (index == 2) {
                  final box = moneyItemKeys[index].currentContext!.findRenderObject() as RenderBox;
                  showCurrencyOverlay(context, box);
                }
              },
              child: MouseRegion(
                onEnter: (_) {
                  if (index == 2) {
                    final box = moneyItemKeys[index].currentContext!.findRenderObject() as RenderBox;
                    showCurrencyOverlay(context, box);
                  }
                },
                onExit: (_) {
                  if (index == 2) removeCurrencyOverlay();
                },
                child: Container(
                  key: moneyItemKeys[index],
                  padding: EdgeInsets.only(left: index == 1 ? 0 : 6, right: 6),
                  decoration: BoxDecoration(color: TColors.white.withAlpha((0.2 * 255).toInt()), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      if (index == 1)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(color: TColors.white, borderRadius: BorderRadius.circular(10)),
                          child: const Text('банк', style: TextStyle(color: TColors.black, fontSize: 12, fontWeight: FontWeight.w500)),
                        )
                      else if (index == 2)
                        Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: TColors.transparent),
                          child: ClipOval(child: SvgPicture.asset(itemsMoney[index]['icon'] as String, width: 12, height: 12)),
                        )
                      else
                        SvgPicture.asset(itemsMoney[index]['icon'] as String, width: 14, height: 14),
                      const SizedBox(width: 4),
                      Padding(
                        padding: EdgeInsets.only(bottom: index == 0 ? 2 : 0),
                        child: Text(itemsMoney[index]['text'] as String, style: const TextStyle(color: TColors.white)),
                      ),
                      if (isLoggedIn && index == 1) ...[
                        const SizedBox(width: 4),
                        Icon(EvaIcons.eye_off, size: 14, color: TColors.white.withAlpha((0.6 * 255).toInt())),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildHoverableItems(bool isNarrow) {
    if (isNarrow) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: HoverableItem(
          icon: Ionicons.location_outline,
          text: '',
          onTap: () {
            Navigator.push(context, createPageRouteNoAnimation(const AddressesScreen(), showAppBar: false));
          },
          showText: false,
        ),
      );
    } else {
      return Obx(() {
        final displayItems = <Map<String, dynamic>>[];

        if (authController.isLoggedIn.value) {
          displayItems.addAll(items);
        } else {
          displayItems.add({'icon': Ionicons.location_sharp, 'text': 'Адреса'});
          displayItems.add({'icon': BootstrapIcons.person_fill, 'text': 'Войти'});
          displayItems.add(items[3]);
        }

        return Row(
          children: displayItems.map((item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: HoverableItem(
                icon: item['icon'] as IconData,
                text: item['text'] as String,
                onTap: () {
                  if (authController.isLoggedIn.value) {
                    final index = displayItems.indexOf(item);
                    switch (index) {
                      case 0:
                        Navigator.push(context, createPageRouteNoAnimation(const OrderScreen()));
                        break;
                      case 1:
                        Navigator.push(context, createPageRouteNoAnimation(const FavoriteStoresScreen()));
                        break;
                      case 2:
                        Navigator.push(context, createPageRouteNoAnimation(const ProfileScreen()));
                        break;
                      case 3:
                        Navigator.push(context, createPageRouteNoAnimation(const CartScreen()));
                        break;
                    }
                  } else {
                    switch (item['text']) {
                      case 'Адреса':
                        Navigator.push(context, createPageRouteNoAnimation(const AddressesScreen(), showAppBar: false));
                        break;
                      case 'Войти':
                        if (isWebOrWindows) {
                          showLoginOverlay(context);
                        } else {
                          Navigator.push(context, createPageRouteNoAnimation(const LoginScreen()));
                        }
                        break;
                      case 'Корзина':
                        Navigator.push(context, createPageRouteNoAnimation(const CartScreen()));
                        break;
                    }
                  }
                },
              ),
            ),
          ).toList(),
        );
      });
    }
  }
}
