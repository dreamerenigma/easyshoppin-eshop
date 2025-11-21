import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import '../../../../data/accordion_data.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_vectors.dart';

class CashbackInfoAccordion extends StatefulWidget {
  const CashbackInfoAccordion({super.key});

  @override
  State<CashbackInfoAccordion> createState() => _CashbackInfoAccordionState();
}

class _CashbackInfoAccordionState extends State<CashbackInfoAccordion> {
  final List<bool> _isExpandedList = [false, false, false];
  final List<bool> _isHoveringList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(cashbackAccordionData.length, (index) {
        final item = cashbackAccordionData[index];
        final isExpanded = _isExpandedList[index];
        final isHovering = _isHoveringList[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpandedList[index] = !isExpanded;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(color: TColors.softNight, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (item.title),
                      style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black, fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() => _isHoveringList[index] = true);
                      },
                      onExit: (_) {
                        setState(() => _isHoveringList[index] = false);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 200),
                          child: SvgPicture.asset(
                            TVectors.arrowDown,
                            colorFilter: ColorFilter.mode(
                              isHovering ? (context.isDarkMode ? TColors.white : TColors.black) : (context.isDarkMode ? TColors.white : TColors.darkGrey),
                              BlendMode.srcIn,
                            ),
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isExpanded) ...[
                  const SizedBox(height: 8),
                  Text(
                    item.text,
                    style: TextStyle(color: context.isDarkMode ? TColors.white : TColors.black, fontWeight: FontWeight.w400, fontSize: TSizes.fontSizeSm),
                  ),
                ],
              ],
            ),
          ),
        );
      }),
    );
  }
}
