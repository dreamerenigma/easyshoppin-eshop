import 'dart:io';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:dotted_border/dotted_border.dart';

class SelectedImagesPanel extends StatelessWidget {
  final List<AssetEntity> selectedImages;
  final Function(int) removeImage;
  final int maxImages = 5;

  const SelectedImagesPanel({
    super.key,
    required this.selectedImages,
    required this.removeImage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(maxImages, (index) {
                  if (selectedImages.length > index) {
                    return GestureDetector(
                      onTap: () {
                        // Implement logic to remove image on tap
                        removeImage(index);
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: FutureBuilder<File?>(
                              future: selectedImages[index].file,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done &&
                                    snapshot.data != null) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(4.0),
                                    child: OverflowBox(
                                      maxWidth: 70,
                                      maxHeight: 90,
                                      child: Image.file(
                                        snapshot.data!,
                                        fit: BoxFit.cover,
                                        width: 70,
                                        height: 90,
                                      ),
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            top: -3,
                            right: -5,
                            child: GestureDetector(
                              onTap: () {
                                // Implement logic to remove image on tap
                                removeImage(index);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return DottedBorder(
                      color: Colors.grey,
                      strokeWidth: 2,
                      dashPattern: const [5, 3],
                      child: const SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }
                }),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.camera_alt),
                onPressed: () {
                  // Implement camera functionality here
                },
              ),
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  Navigator.pop(context, selectedImages);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
