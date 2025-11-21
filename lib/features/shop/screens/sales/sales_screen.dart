import 'dart:async';
import 'package:easyshoppin_eshop/features/shop/controllers/sale_controller.dart';
import 'package:easyshoppin_eshop/features/shop/models/sale_model.dart';
import 'package:easyshoppin_eshop/features/shop/screens/sales/widgets/time_counter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_images.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../utils/widgets/no_glow_scroll_behavior.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key, required this.sale});

  final SaleModel sale;

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  late Future<void> _loadingFuture;
  final TextEditingController _searchController = TextEditingController();
  late Timer _timer;
  late Duration _remainingTime;

  @override
  void initState() {
    super.initState();
    _loadingFuture = Future.delayed(const Duration(seconds: 1));
    _remainingTime = Duration(days: 5);
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = SaleController.instance;

    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        titleSpacing: 0,
        showBackArrow: true,
        title: Row(
          children: [
            Expanded(
              child: TextSelectionTheme(
                data: TextSelectionThemeData(
                  cursorColor: TColors.blue,
                  selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                  selectionHandleColor: TColors.blue,
                ),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _searchController,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: "Найти в Easy Shoppin",
                      hintStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeSm),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      filled: true,
                      fillColor: TColors.darkerGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(fontSize: TSizes.fontSizeMd),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                final url = 'https://easyshoppin.ru/promotions/sl/${widget.sale.name}/';
                final text = 'Смотри, что есть на EasyShoppin!';
                SharePlus.instance.share(ShareParams(text: '$text $url'));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 16),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: TColors.darkerGrey,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(FontAwesomeIcons.share, color: TColors.white, size: 22),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<void>(
        future: _loadingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(TColors.primary)));
          }
          return ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItemsSmall, vertical: TSizes.spaceBtwLittle),
                child: Column(
                  children: [
                    /// Banner
                    const TRoundedImage(width: double.infinity, imageUrl: TImages.banner5, applyImageRadius: true),
                    const SizedBox(height: TSizes.spaceBtwItemsSmall),
                    TimeCounter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
