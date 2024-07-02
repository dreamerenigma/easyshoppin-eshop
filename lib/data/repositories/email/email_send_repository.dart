import 'dart:io';
import 'dart:typed_data';
import 'package:logger/logger.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:get/get.dart';
import 'package:easyshoppin_eshop/utils/popups/loaders.dart';
import 'package:path_provider/path_provider.dart';

class EmailSendRepository extends GetxController {
  static EmailSendRepository get instance => Get.find();

  Future<bool> sendFeedback(String dropdownValue, String suggestion, String userEmail, List<Uint8List> images) async {
    String username = 'jarekismail@gmail.com';
    String password = 'ndti ivpn qfjk wgjz';

    final smtpServer = gmail(username, password);
    final Logger logger = Logger();

    final message = Message()
      ..from = Address(username, 'Easy Shoppin Support')
      ..recipients.add('jarekismail@gmail.com')
      ..subject = dropdownValue
      ..text = 'Reason: $dropdownValue\n\nSuggestion: $suggestion\n\nUser email: $userEmail';

    for (int i = 0; i < images.length; i++) {
      String extension = 'jpg'; // Default extension
      if (images[i][0] == 0xFF && images[i][1] == 0xD8) {
        extension = 'jpg'; // JPEG format
      } else if (images[i][0] == 0x89 && images[i][1] == 0x50 && images[i][2] == 0x4E && images[i][3] == 0x47) {
        extension = 'png'; // PNG format
      } else if (images[i][0] == 0x47 && images[i][1] == 0x49 && images[i][2] == 0x46 && images[i][3] == 0x38) {
        extension = 'gif'; // GIF format
      }

      Directory tempDir = await getTemporaryDirectory();
      File tempFile = File('${tempDir.path}/image_$i.$extension');
      await tempFile.writeAsBytes(images[i]);

      message.attachments.add(
        FileAttachment(tempFile),
      );
    }

    try {
      final sendReport = await send(message, smtpServer);
      TLoaders.customToast(message: 'Feedback sent successfully!');
      logger.d('Message sent: $sendReport');
      return true;
    } on MailerException catch (e) {
      TLoaders.customToast(message: 'Failed to send feedback.');
      logger.d('Message not sent. \n$e');
      return false;
    }
  }
}
