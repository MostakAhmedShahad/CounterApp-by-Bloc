part of 'post_api_bloc.dart';

sealed class PostApiState extends Equatable {
  const PostApiState();
  
  @override
  List<Object> get props => [];
}

final class PostApiInitial extends PostApiState {}
