import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class SafeModeWidget extends StatelessWidget {
  const SafeModeWidget({super.key});

  Future<String> _getFilteredContent(String contentId) async {
    final box = GetStorage();
    bool isSafeModeEnabled = box.read('isSafeModeEnabled') ?? false;

    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('content').doc(contentId).get();

    if (isSafeModeEnabled) {
      // Logic to filter content based on Safe Mode
      return snapshot.get('filtered_content'); // Assuming you have a field for filtered content
    } else {
      return snapshot.get('content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safe Mode Content'),
      ),
      body: FutureBuilder<String>(
        future: _getFilteredContent('contentId'), // Replace with your content ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No content found'));
          }

          return Center(child: Text(snapshot.data!));
        },
      ),
    );
  }
}
