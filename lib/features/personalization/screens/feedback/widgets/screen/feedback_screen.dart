import 'package:flutter/material.dart';
import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../generated/l10n/l10n.dart';
import '../form/feedback_form.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  FeedbackScreenState createState() => FeedbackScreenState();
}

class FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).feedback,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FeedbackForm(),
        ),
      ),
    );
  }
}
