import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildButton(context, "Top News API", "/top-news"),
            _buildButton(context, "Photos API", "/photos"),
            _buildButton(context, "Posts API", "/posts"),
            _buildButton(context, "Timer Screen", "/timer"),
            _buildButton(context, "Favorite Items", "/favorites"),
            _buildButton(context, "ListView Screen", "/list-view"),
            _buildButton(context, "Image Picker", "/image-picker"),
            _buildButton(context, "Counter Screen", "/counter"),
            _buildButton(context, "Switch Screen", "/switch"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          context.go(route);
        },
        child: Text(title),
      ),
    );
  }
}
