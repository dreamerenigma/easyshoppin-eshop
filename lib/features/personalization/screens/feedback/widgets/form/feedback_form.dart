import 'dart:typed_data';
import 'package:easyshoppin_eshop/features/personalization/screens/feedback/widgets/dropdown/feedback_dropdown.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/feedback/widgets/image/image_selector.dart';
import 'package:easyshoppin_eshop/features/personalization/screens/feedback/widgets/input/feedback_input.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../information/widgets/buttons/feedback_button.dart';
import '../../../../../../../data/repositories/email/email_send_repository.dart';
import '../../../../../../../generated/l10n/l10n.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key, this.selectedImages});

  final List<AssetEntity>? selectedImages;

  @override
  FeedbackFormState createState() => FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackForm> {
  String? dropdownValue;
  TextEditingController suggestionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late List<AssetEntity> _selectedImages;

  bool allFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    dropdownValue = 'Сообщить о неполадке';
    suggestionController.addListener(checkFieldsFilled);
    emailController.addListener(checkFieldsFilled);
    Future.delayed(Duration.zero, checkFieldsFilled);
    _selectedImages = widget.selectedImages ?? [];
  }

  @override
  void dispose() {
    suggestionController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void checkFieldsFilled() {
    setState(() {
      allFieldsFilled = dropdownValue != null &&
          suggestionController.text.isNotEmpty &&
          emailController.text.isNotEmpty;
    });
  }

  Future<void> handleSendFeedback() async {
    List<Uint8List> imageBytes = [];

    for (AssetEntity image in _selectedImages) {
      Uint8List? bytes = await image.originBytes;
      if (bytes != null) {
        imageBytes.add(bytes);
      }
    }

    bool success = await EmailSendRepository.instance.sendFeedback(
      dropdownValue ?? 'Feedback',
      suggestionController.text,
      emailController.text,
      imageBytes,
    );

    if (success) {
      setState(() {
        suggestionController.clear();
        emailController.clear();
        _selectedImages.clear();
        allFieldsFilled = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).feedbackWhatWouldLike,
            style: Theme.of(context).textTheme.titleMedium!.apply(fontWeightDelta: 2),
          ),
          const SizedBox(height: 16.0),
          FeedbackDropdown(
            dropdownValue: dropdownValue,
            onChanged: (value) {
              setState(() {
                dropdownValue = value;
              });
              checkFieldsFilled();
            },
          ),
          const SizedBox(height: 40.0),
          FeedbackInput(
            controller: suggestionController,
            hintText: S.of(context).yourSuggestion,
          ),
          const SizedBox(height: 16.0),
          Text(
            S.of(context).describeProposal,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20.0),
          ImageSelector(
            selectedImages: _selectedImages,
            onRemoveImage: (index) => setState(() => _selectedImages.removeAt(index)),
            onAddImage: (images) => setState(() => _selectedImages = images),
          ),
          const SizedBox(height: 10.0),
          FeedbackInput(
            controller: emailController,
            hintText: S.of(context).enterEmailAddress,
          ),
          const SizedBox(height: 16.0),
          FeedbackButton(
            allFieldsFilled: allFieldsFilled,
            handleSendFeedback: handleSendFeedback,
          ),
          const SizedBox(height: 16.0),
          Text(
            S.of(context).feedbackApplication,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
