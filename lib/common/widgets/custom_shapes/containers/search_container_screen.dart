import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import '../../../../features/shop/screens/search_field/search.dart';
import '../../../../utils/constants/sizes.dart';

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
    this.width,
    this.textStyle, // New property for text style
  });

  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
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
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _navigateToSearchScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchScreen(searchText: widget.controller?.text ?? '')),
    ).then((_) {
      // Refocus on the original text field when coming back from SearchScreen
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
          width: widget.width ?? 300, // Set a fixed width or use a default value
          child: Container(
            padding: const EdgeInsets.all(TSizes.xs),
            child: TextField(
              focusNode: _focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: widget.text,
                border: widget.showBorder
                    ? OutlineInputBorder(
                  borderSide: const BorderSide(color: TColors.grey),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                )
                    : InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: TColors.grey),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: TColors.white),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                ),
                prefixIcon: Icon(
                  widget.icon,
                  color: dark ? TColors.darkerGrey : Colors.grey,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: HeroIcon(HeroIcons.microphone, color: dark ? TColors.darkerGrey : Colors.grey),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                    IconButton(
                      icon: Icon(Iconsax.camera, color: dark ? TColors.darkerGrey : Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                filled: true,
                fillColor: widget.showBackground
                    ? dark
                    ? TColors.dark
                    : TColors.light
                    : Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
