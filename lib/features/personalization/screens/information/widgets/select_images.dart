import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../generated/l10n/l10n.dart';
import 'image_grid_widget.dart';
import 'selected_images_panel.dart';

class SelectImagesScreen extends StatefulWidget {
  const SelectImagesScreen({super.key});

  @override
  SelectImagesScreenState createState() => SelectImagesScreenState();
}

class SelectImagesScreenState extends State<SelectImagesScreen> {
  final List<AssetEntity> _imageList = [];
  final List<AssetEntity> _selectedImages = [];
  List<bool> selectedImages = [];
  bool _loading = true;
  int currentPage = 0;
  final int pageSize = 50;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    try {
      final PermissionState permissionState = await PhotoManager.requestPermissionExtend();

      if (permissionState.isAuth) {
        List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
          onlyAll: true,
          type: RequestType.image,
        );

        if (albums.isNotEmpty) {
          List<AssetEntity> images = await albums[0].getAssetListPaged(
            page: currentPage,
            size: pageSize,
          );

          setState(() {
            _imageList.addAll(images);
            selectedImages.addAll(List.generate(images.length, (index) => false));
            _loading = false;
          });
        } else {
          setState(() {
            _loading = false;
          });
        }
      } else {
        PhotoManager.openSetting();
        setState(() {
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
  }

  void toggleImageSelection(int index) {
    setState(() {
      selectedImages[index] = !selectedImages[index];
      if (selectedImages[index]) {
        _selectedImages.add(_imageList[index]);
      } else {
        _selectedImages.remove(_imageList[index]);
      }
    });
  }

  void removeImage(int index) {
    setState(() {
      selectedImages[_imageList.indexOf(_selectedImages[index])] = false;
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          S.of(context).selectImages,
          style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _imageList.isEmpty
                ? Center(child: Text(S.of(context).noImagesFound))
                : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!_loading &&
                    scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                  currentPage++;
                  loadImages();
                }
                return true;
              },
              child: ImageGridWidget(
                imageList: _imageList,
                selectedImages: selectedImages,
                toggleImageSelection: toggleImageSelection,
              ),
            ),
          ),
          SelectedImagesPanel(
            selectedImages: _selectedImages,
            removeImage: removeImage,
          ),
        ],
      ),
    );
  }
}
