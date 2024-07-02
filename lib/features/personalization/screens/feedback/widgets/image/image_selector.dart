import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:typed_data';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import '../../../information/widgets/select_images.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({
    super.key,
    required this.selectedImages,
    required this.onRemoveImage,
    required this.onAddImage,
  });

  final List<AssetEntity> selectedImages;
  final void Function(int) onRemoveImage;
  final void Function(List<AssetEntity>) onAddImage;

  Future<void> _showSelectImagesScreen(BuildContext context) async {
    if (selectedImages.length < 5) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectImagesScreen(),
        ),
      );
      if (result != null && result is List<AssetEntity>) {
        onAddImage(result);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...selectedImages.asMap().entries.map((entry) {
          int index = entry.key;
          AssetEntity image = entry.value;
          return Stack(
            children: [
              FutureBuilder<Uint8List?>(
                future: image.thumbnailDataWithSize(const ThumbnailSize(50, 50)),
                builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.memory(
                        snapshot.data!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    return const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }
                },
              ),
              Positioned(
                top: -3,
                right: -3,
                child: GestureDetector(
                  onTap: () => onRemoveImage(index),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        }),
        if (selectedImages.length < 5)
          GestureDetector(
            onTap: () => _showSelectImagesScreen(context),
            child: const Icon(
              BootstrapIcons.camera_fill,
              size: 40,
            ),
          ),
      ],
    );
  }
}
