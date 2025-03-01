import 'package:app_10/ui/api/post_api/ui/json_to_dart.dart';
import 'package:equatable/equatable.dart';
 

abstract class PostApiState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostApiInitial extends PostApiState {}

class PostApiLoading extends PostApiState {}

class PostApiLoaded extends PostApiState {
  final List<PostApi> posts;
  
  PostApiLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostApiError extends PostApiState {
  final String message;
  
  PostApiError(this.message);

  @override
  List<Object> get props => [message];
}
