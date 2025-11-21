import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/wallet/widgets/settings_help_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/app_sizes.dart';

class SettingsHelpScreen extends StatelessWidget {
  const SettingsHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Настройки и помощь', style: TextStyle(fontSize: TSizes.fontSizeXl)),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          children: [
            SettingsHelpMenuTile(
              icon: Ionicons.exit_outline,
              title: 'Безопасный вход',
              subTitle: 'В ES Кошелёк',
              onTap: () {},
            ),
            SettingsHelpMenuTile(
              icon: BootstrapIcons.arrow_down_up,
              title: 'Настройки переводов',
              subTitle: 'Через систему быстрых платежей',
              onTap: () {},
            ),
            SettingsHelpMenuTile(
              icon: BootstrapIcons.question_circle,
              title: 'Вопросы и ответы',
              subTitle: 'Про оплату и переводы',
              onTap: () {},
            ),
            SettingsHelpMenuTile(
              icon: Icons.support_agent_rounded,
              title: 'Чат с поддержкой',
              subTitle: 'Если не нашли ответ на свой вопрос',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
