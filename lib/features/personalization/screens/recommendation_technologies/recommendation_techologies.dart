import 'package:easyshoppin_eshop/features/personalization/screens/recommendation_technologies/widgets/recommendation_techologies_widget.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/sizes.dart';

class RecommendationTechnologiesScreen extends StatelessWidget {
  const RecommendationTechnologiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).recommendationTechnologies,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              RecommendationTechnologiesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
