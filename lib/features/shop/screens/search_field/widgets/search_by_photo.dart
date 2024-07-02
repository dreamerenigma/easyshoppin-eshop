import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../../../../../common/widgets/appbar/camappbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'camera/camera.dart';

class SearchByPhotoScreen extends StatefulWidget {
  const SearchByPhotoScreen({super.key});

  @override
  SearchByPhotoScreenState createState() => SearchByPhotoScreenState();
}

class SearchByPhotoScreenState extends State<SearchByPhotoScreen> {
  File? _lastImage;
  bool _isFrontCamera = false;
  bool _isFlashOn = false;

  void toggleCamera() {
    setState(() {
      _isFrontCamera = !_isFrontCamera;
    });
  }

  Future<void> loadLastImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _lastImage = File(pickedFile.path);
      });
    }
  }

  void toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CamAppBar(
        title: Text(
          S.of(context).linkBankSBP,
          style: const TextStyle(fontSize: TSizes.fontSizeBg),
        ),
        showClose: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: RotationTransition(
                            turns: _isFrontCamera ? const AlwaysStoppedAnimation(0) : const AlwaysStoppedAnimation(1),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 16.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: CameraScreen(
                                isFrontCamera: _isFrontCamera,
                                toggleCamera: toggleCamera,
                                isFlashOn: _isFlashOn,
                                toggleFlash: toggleFlash,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16.0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: IntrinsicWidth(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: const Text(
                                'Сделайте фото для поиска',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_lastImage != null)
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                          image: DecorationImage(
                            image: FileImage(_lastImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    const SizedBox(width: 8.0),
                    IconButton(
                      icon: const Icon(FluentIcons.multiplier_1x_28_filled, size: 45),
                      onPressed: () {},
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12.0),
                    Container(
                      margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    IconButton(
                      icon: const Icon(TablerIcons.refresh),
                      onPressed: () {
                        toggleCamera();
                      },
                      color: Colors.white,
                    ),
                    const SizedBox(width: 12.0),
                    IconButton(
                      icon: Icon(
                        _isFlashOn ? SolarIconsBold.flashlightOn : SolarIconsBold.flashlight,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: toggleFlash, // Use toggleFlash from _SearchByPhotoScreenState
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 110.0),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.16,
            minChildSize: 0.16,
            maxChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: TColors.buttonDarkGrey,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  children: [
                    const SizedBox(height: 8.0),
                    Center(
                      child: Container(
                        width: 40.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Center(
                      child: Text(
                        'Выбрать из галереи',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  bool isSheetExpanded() {
    return _isFrontCamera;
  }
}
