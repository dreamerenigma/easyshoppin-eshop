import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import '../../../../features/shop/screens/search_field/search_screen.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/constants/app_sizes.dart';

class TSearchContainerScreen extends StatefulWidget {
  const TSearchContainerScreen({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.onChanged,
    this.controller,
    this.focusNode,
    this.width,
    this.textStyle,
  });

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? width;
  final TextStyle? textStyle;

  @override
  TSearchContainerState createState() => TSearchContainerState();
}

class TSearchContainerState extends State<TSearchContainerScreen> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _navigateToSearchScreen() {
    Navigator.of(context).push(
      createPageRoute(SearchScreen(searchText: widget.controller?.text ?? '')),
    ).then((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        _navigateToSearchScreen();
      },
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: widget.width ?? 330,
          child: Container(
            padding: const EdgeInsets.all(TSizes.xs),
            child: TextSelectionTheme(
              data: TextSelectionThemeData(
                cursorColor: TColors.blue,
                selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
                selectionHandleColor: TColors.blue,
              ),
              child: TextField(
                focusNode: _focusNode,
                controller: widget.controller,
                onChanged: widget.onChanged,
                textCapitalization: TextCapitalization.sentences,
                style: const TextStyle(fontSize: TSizes.fontSizeMd),
                decoration: InputDecoration(
                  hintText: widget.text,
                  hintStyle: TextStyle(fontSize: 15, color: dark ? TColors.darkGrey : TColors.grey),
                  border: widget.showBorder ? OutlineInputBorder(
                    borderSide: const BorderSide(color: TColors.darkerGrey),
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  ) : InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: TColors.darkerGrey),
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: TColors.darkGrey),
                    borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                  ),
                  prefixIcon: Icon(widget.icon, color: dark ? TColors.darkGrey : TColors.grey),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: HeroIcon(HeroIcons.microphone, color: dark ? TColors.darkGrey : TColors.grey),
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                      ),
                      IconButton(
                        icon: Icon(Iconsax.camera, color: dark ? TColors.darkGrey : TColors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  filled: true,
                  fillColor: widget.showBackground ? dark ? TColors.dark : TColors.light : TColors.transparent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
