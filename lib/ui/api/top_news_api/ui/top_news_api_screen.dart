import 'dart:convert';
import 'package:app_10/ui/api/top_news_api/ui/json_to_dart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopNewsApiScreen extends StatefulWidget {
  const TopNewsApiScreen({super.key});

  @override
  State<TopNewsApiScreen> createState() => _TopNewsApiScreenState();
}

class _TopNewsApiScreenState extends State<TopNewsApiScreen> {
  List<Articles> articles = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchTopNews();
  }

  Future<void> fetchTopNews() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=b161b2ae3a014c59adfd0dfeea70b6f8');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          articles = (jsonData['articles'] as List)
              .map((item) => Articles.fromJson(item))
              .toList();
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top News')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? const Center(child: Text('Failed to load news'))
              : ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: article.urlToImage != null
                            ? Image.network(article.urlToImage!,
                                width: 80, height: 80, fit: BoxFit.cover)
                            : const Icon(Icons.image_not_supported),
                        title: Text(article.title ?? "No Title",
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(article.description ?? "No Description"),
                        onTap: () {
                          // Open news URL in browser
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
