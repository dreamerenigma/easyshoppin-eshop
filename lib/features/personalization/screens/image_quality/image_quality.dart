import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class ImageQuality extends StatelessWidget {
  const ImageQuality({super.key});

  Future<String> _getImageUrl(String imageId) async {
    final box = GetStorage();
    bool isHDEnabled = box.read('isHDEnabled') ?? false;
    String resolution = isHDEnabled ? '720p' : 'default';

    // Fetch the image URL from Firestore based on the resolution
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('images').doc(imageId).get();
    return snapshot.get(resolution); // Assuming your Firestore document has fields like '720p', 'default', etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Quality'),
      ),
      body: FutureBuilder<String>(
        future: _getImageUrl('imageId'), // Replace with your image ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No image found'));
          }

          return Column(
            children: [
              Text('Image Quality: ${snapshot.data!.contains("720p") ? "HD" : "Default"}'), // For debugging purposes
              Image.network(snapshot.data!),
            ],
          );
        },
      ),
    );
  }
}
