import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  MapsScreenState createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  late YandexMapController _controller;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    logger.d("MapsScreen initialized");
  }

  @override
  void dispose() {
    logger.d("MapsScreen disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yandex Map')),
      body: YandexMap(
        onMapCreated: (YandexMapController controller) {
          _controller = controller;
          logger.d("Map created!");

          const point = Point(latitude: 59.945933, longitude: 30.320045);
          const cameraPosition = CameraPosition(
            target: point,
            zoom: 14.0,
          );

          _controller.moveCamera(
            CameraUpdate.newCameraPosition(cameraPosition),
            animation: const MapAnimation(type: MapAnimationType.smooth, duration: 5.0),
          ).then((_) {
            logger.d("Camera moved to the position");
          }).catchError((error) {
            logger.e("Error moving camera: $error");
          });
        },
      ),
    );
  }
}