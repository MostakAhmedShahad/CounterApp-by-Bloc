 import 'dart:convert';
import 'package:app_10/ui/api/top_news_api/ui/json_to_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'top_news_api_event.dart';
import 'top_news_api_state.dart';


class TopNewsApiBloc extends Bloc<TopNewsApiEvent, TopNewsApiState> {
  TopNewsApiBloc() : super(TopNewsInitial()) {
    on<FetchTopNews>(_fetchNews);
  }

  Future<void> _fetchNews(
      FetchTopNews event, Emitter<TopNewsApiState> emit) async {
    emit(TopNewsLoading());

    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=b161b2ae3a014c59adfd0dfeea70b6f8');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<Articles> articles = (jsonData['articles'] as List)
            .map((item) => Articles.fromJson(item))
            .toList();
        emit(TopNewsLoaded(articles));
      } else {
        emit(TopNewsError("Failed to fetch news"));
      }
    } catch (e) {
      emit(TopNewsError("An error occurred: $e"));
    }
  }
}
