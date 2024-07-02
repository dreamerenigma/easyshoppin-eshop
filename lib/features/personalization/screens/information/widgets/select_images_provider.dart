import 'package:flutter/foundation.dart';
import 'package:photo_manager/photo_manager.dart';

class SelectedImagesProvider extends ChangeNotifier {
  List<AssetEntity> _selectedImages = [];

  List<AssetEntity> get selectedImages => _selectedImages;

  void addImage(AssetEntity image) {
    _selectedImages.add(image);
    notifyListeners();
  }

  void removeImage(AssetEntity image) {
    _selectedImages.remove(image);
    notifyListeners();
  }

  void setSelectedImages(List<AssetEntity> images) {
    _selectedImages = images;
    notifyListeners();
  }
}