import 'package:easyshoppin_eshop/features/personalization/screens/information/widgets/select_images.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/text_strings.dart';

void showCameraDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(TTexts.chooseAction),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text(S.of(context).makePhoto),
              onTap: () {
                // Add code to open camera
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(S.of(context).selectAvailable),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SelectImagesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: Text(S.of(context).feedbackCancelButton),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
