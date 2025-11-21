import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final bool isFrontCamera;
  final bool isFlashOn;
  final VoidCallback toggleCamera;
  final VoidCallback toggleFlash;

  const CameraScreen({
    super.key,
    required this.isFrontCamera,
    required this.isFlashOn,
    required this.toggleCamera,
    required this.toggleFlash,
  });

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        widget.isFrontCamera ? _cameras![1] : _cameras![0],
        ResolutionPreset.high,
      );

      if (_cameraController.value.flashMode == FlashMode.torch) {
        _cameraController.setFlashMode(FlashMode.off);
      }

      await _cameraController.initialize();
      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant CameraScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFrontCamera != widget.isFrontCamera) {
      _cameraController.dispose().then((_) {
        _initializeCamera();
      });
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isCameraInitialized
        ? CameraPreview(_cameraController)
        : Container();
  }
}
