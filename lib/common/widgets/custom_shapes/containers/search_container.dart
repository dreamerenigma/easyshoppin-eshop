import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:easyshoppin_eshop/utils/constants/colors.dart';
import 'package:easyshoppin_eshop/utils/device/device_utility.dart';
import 'package:easyshoppin_eshop/utils/helpers/helper_functions.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import '../../../../features/shop/screens/search_field/search.dart';
import '../../../../features/shop/screens/search_field/widgets/search_by_photo.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TSearchContainer extends StatefulWidget {
  const TSearchContainer({
    super.key,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
    this.onChanged,
    this.controller,
  });

  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

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
    if (_focusNode.hasFocus) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SearchScreen(searchText: widget.controller?.text ?? '')),
      );
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
            _navigateToSearchScreen(_text);
          });
        },
      );

      if (!result) {
        logger.e('Failed to show Google Speech to Text dialog');
      }
    }
  }

  void _navigateToSearchScreen(String searchText) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchScreen(searchText: searchText),
      ),
    ).then((_) {
      // Refocus on the original text field when coming back from SearchScreen
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    searchText = S.of(context).search;

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: widget.padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.xs),
          child: TextField(
            focusNode: _focusNode,
            controller: widget.controller,
            onChanged: widget.onChanged,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: searchText,
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
                    onPressed: _listen,
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    icon: Icon(Iconsax.camera, color: dark ? TColors.darkerGrey : Colors.grey),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SearchByPhotoScreen()),
                      );
                    },
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
    );
  }
}
