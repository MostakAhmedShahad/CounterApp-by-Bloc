 import 'package:app_10/ui/api/top_news_api/ui/json_to_dart.dart';
import 'package:equatable/equatable.dart';
 

abstract class TopNewsApiState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopNewsInitial extends TopNewsApiState {}

class TopNewsLoading extends TopNewsApiState {}

class TopNewsLoaded extends TopNewsApiState {
  final List<Articles> articles;
  TopNewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class TopNewsError extends TopNewsApiState {
  final String message;
  TopNewsError(this.message);

  @override
  List<Object> get props => [message];
}
