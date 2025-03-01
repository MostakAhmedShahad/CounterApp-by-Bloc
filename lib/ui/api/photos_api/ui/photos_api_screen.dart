import 'dart:convert';
import 'package:app_10/ui/api/photos_api/ui/json_to_dart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class PhotosApiScreen extends StatefulWidget {
  const PhotosApiScreen({super.key});

  @override
  State<PhotosApiScreen> createState() => _PhotosApiScreenState();
}

class _PhotosApiScreenState extends State<PhotosApiScreen> {
  Future<List<PhotosApi>> fetchPhotos() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => PhotosApi.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photos API')),
      body: FutureBuilder<List<PhotosApi>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No photos available'));
          }
          
          List<PhotosApi> photos = snapshot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 images per row
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            padding: const EdgeInsets.all(10),
            itemCount: 20, // Display only 20 photos
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(photos[index].thumbnailUrl ?? ''),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        photos[index].title ?? 'No Title',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
