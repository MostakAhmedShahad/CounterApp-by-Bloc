import 'package:app_10/ui/api/post_api/ui/json_to_dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_api_event.dart';
import 'post_api_state.dart';
 

class PostApiBloc extends Bloc<PostApiEvent, PostApiState> {
  PostApiBloc() : super(PostApiInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostApiState> emit) async {
    emit(PostApiLoading());

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<PostApi> posts = jsonData.map((data) => PostApi.fromJson(data)).toList();
        emit(PostApiLoaded(posts));
      } else {
        emit(PostApiError("Failed to load posts"));
      }
    } catch (e) {
      emit(PostApiError("Something went wrong!"));
    }
  }
}
