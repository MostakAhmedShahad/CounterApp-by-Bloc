import 'package:app_10/ui/api/top_news_api/bloc/bloc/top_news_api_bloc.dart';
import 'package:app_10/ui/api/top_news_api/bloc/bloc/top_news_api_event.dart';
import 'package:app_10/ui/api/top_news_api/bloc/bloc/top_news_api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 

class TopNewsApiScreen extends StatelessWidget {
  const TopNewsApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Top News" style: TextStyle(fontSize: 20),)),
      body: BlocProvider(
        create: (context) => TopNewsApiBloc()..add(FetchTopNews()),
        child: BlocBuilder<TopNewsApiBloc, TopNewsApiState>(
          builder: (context, state) {
            if (state is TopNewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopNewsLoaded) {
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final article = state.articles[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: article.urlToImage != null
                          ? Image.network(article.urlToImage!,
                              width: 80, height: 80, fit: BoxFit.cover)
                          : const Icon(Icons.image_not_supported),
                      title: Text(article.title ?? "No Title",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(article.description ?? "No Description"),
                    ),
                  );
                },
              );
            } else if (state is TopNewsError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text("No data available"));
          },
        ),
      ),
    );
  }
}
