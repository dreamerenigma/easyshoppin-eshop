import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_sizes.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: TextSelectionTheme(
        data: TextSelectionThemeData(
          cursorColor: TColors.blue,
          selectionColor: TColors.blue.withAlpha((0.3 * 255).toInt()),
          selectionHandleColor: TColors.blue,
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(FeatherIcons.search, color: TColors.darkGrey, size: 24),
            ),
            suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () => _controller.clear(),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(color: TColors.darkGrey.withAlpha(70), shape: BoxShape.circle),
                    child: Icon(Icons.close_rounded, color: TColors.white, size: 19),
                  ),
                )
              : null,
            hintText: 'Поиск мест и адресов',
            hintStyle: TextStyle(color: TColors.darkGrey, fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400),
            filled: true,
            fillColor: TColors.steelGrey.withAlpha((0.3 * 255).toInt()),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: TColors.steelGrey.withAlpha((0.5 * 255).toInt()), width: 1)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: TColors.blue, width: 1)),
          ),
          style: const TextStyle(color: TColors.white, fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
