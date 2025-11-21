import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/constants/app_colors.dart';
import 'package:easyshoppin_eshop/utils/device/device_utility.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:ionicons/ionicons.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import '../../../../features/shop/screens/categories/categories_screen.dart';
import '../../../../features/shop/screens/search_field/search_screen.dart';
import '../../../../features/shop/screens/search_field/widgets/search_by_photo.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../routes/custom_page_route.dart';
import '../../../../utils/constants/app_sizes.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    this.icon = Ionicons.book,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems),
    this.onChanged,
    this.controller,
    this.focusNode,
    this.searchText,
    this.shouldNavigate = false,
    this.showPrefixIcon = true,
    this.suffixIconSearchOnly = false,
  });

  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? searchText;
  final bool shouldNavigate;
  final bool showPrefixIcon;
  final bool suffixIconSearchOnly;

  @override
  TSearchContainerState createState() => TSearchContainerState();
}

class TSearchContainerState extends State<TSearchContainer> {
  late FocusNode _focusNode;
  late String searchText;
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';
  final logger = Logger();
  late SpeechToTextGoogleDialog _googleDialog;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _googleDialog = SpeechToTextGoogleDialog.getInstance();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (val) => logger.d('onStatus: $val'),
      onError: (val) => logger.d('onError: $val'),
    );
    if (!available) {
      logger.e('Speech recognition not available');
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && widget.shouldNavigate) {
      Navigator.of(context).push(createPageRoute(SearchScreen(searchText: widget.controller?.text ?? '')));
      _focusNode.unfocus();
    }
  }

  void _listen() async {
    if (!_isListening) {
      final result = await _googleDialog.showGoogleDialog(
        locale: 'en_US',
        onTextReceived: (dynamic data) {
          setState(() {
            _text = data;
            widget.controller?.text = _text;
            _isListening = false;
            widget.onChanged?.call(_text);
          });
        },
      );

      if (!result) {
        logger.e('Failed to show Google Speech to Text dialog');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    searchText = widget.searchText ?? S.of(context).search;

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: SizedBox(
          width: DeviceUtils.getScreenWidth(context),
          height: TSizes.appBarHeight,
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
                hintText: searchText,
                hintStyle: TextStyle(fontSize: 15, color: dark ? TColors.darkGrey : TColors.grey),
                border: widget.showBorder ? OutlineInputBorder(
                  borderSide: const BorderSide(color: TColors.darkerGrey),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                )
                  : InputBorder.none,
                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: TColors.darkerGrey), borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: TColors.darkGrey), borderRadius: BorderRadius.circular(TSizes.cardRadiusLg)),
                prefixIcon: widget.showPrefixIcon
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, createPageRoute(CategoriesScreen()));
                            },
                            child: Icon(widget.icon, color: dark ? TColors.darkGrey : TColors.grey),
                          ),
                          Container(
                            width: 1,
                            height: 24,
                            color: dark ? TColors.darkGrey : TColors.grey,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                          ),
                        ],
                      ),
                    )
                  : null,
                suffixIcon: widget.suffixIconSearchOnly
                  ? InkWell(
                    onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: dark ? TColors.darkGrey.withAlpha((0.2 * 255).toInt()) : TColors.grey.withAlpha((0.2 * 255).toInt()),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          icon: Icon(Iconsax.search_normal, color: dark ? TColors.darkGrey : TColors.grey),
                          onPressed: widget.onTap,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                  )
                  : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: HeroIcon(HeroIcons.microphone, color: dark ? TColors.darkGrey : TColors.grey),
                            onPressed: _listen,
                            padding: EdgeInsets.zero,
                          ),
                          IconButton(
                            icon: Icon(Iconsax.camera, color: dark ? TColors.darkGrey : TColors.grey),
                            onPressed: () {
                              Navigator.push(context, createPageRoute(const SearchByPhotoScreen()));
                            },
                          ),
                        ],
                      ),
                  ),
                contentPadding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
                filled: true,
                fillColor: widget.showBackground ? dark ? TColors.dark : TColors.light : TColors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
