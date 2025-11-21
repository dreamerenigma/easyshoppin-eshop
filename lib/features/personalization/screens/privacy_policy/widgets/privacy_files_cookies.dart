import 'package:flutter/material.dart';
import '../../../../../common/widgets/texts/bullet_point_text.dart';
import '../../../../../common/widgets/texts/rich_helper_text.dart';
import '../../../../../generated/l10n/l10n.dart';

class PrivacyFilesCookies extends StatelessWidget {
  const PrivacyFilesCookies({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRichTextSimple(context, '6.1.', S.of(context).cookiesSiteServiceUsed),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildBulletPoint(
                  'Необходимые Файлы cookies '
                  '- Эти Файлы cookies обеспечивают надлежащую работу Сайта и / или Сервиса, они являются необходимыми '
                  '- Предназначены для обеспечения надлежащего отображения интерфейсов и их интерактивных компонентов',
                ),
                SizedBox(height: 20),
                buildBulletPoint(
                  'Функциональные Файлы cookies '
                  '- Эти Файлы cookies сохраняют предпочтения в отношении настроек Сайта и / или Сервиса '
                  '- Предназначены для упрощения использования Сайта и / или Сервиса, лучшего пользовательского опыта',
                ),
                SizedBox(height: 20),
                buildBulletPoint(
                  'Аналитические Файлы cookies '
                  '- Эти Файлы cookies сохраняют агрегированную информацию об использовании Сайта и / или Сервиса и их отдельных элементов '
                  '- Предназначены для дальнейшего улучшения интерфейсов, планирования развития Сайта и / или Сервиса',
                ),
                SizedBox(height: 20),
                buildBulletPoint(
                  'Маркетинговые Файлы cookies '
                  '- Эти Файлы cookies сохраняют информацию о том, как используется Сайт и / или Сервис, то есть, предпочтения в отношении Сайта и / или Сервиса '
                  '- Предназначены для персонализации Сайта и / или Сервиса, оптимизации рекламных коммуникаций, оценки эффективности персонализации',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildRichTextSimple(context, '6.2.', S.of(context).optOutUseCookies),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinkBulletPoint(
                  text: 'Google Chrome',
                  url: 'Google Chrome',
                ),
                LinkBulletPoint(
                  text: 'Safari',
                  url: 'Safari',
                ),
                LinkBulletPoint(
                  text: 'Яндекс Браузер',
                  url: 'Яндекс Браузер',
                ),
                LinkBulletPoint(
                  text: 'Mozilla Firefox',
                  url: 'Mozilla Firefox',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
