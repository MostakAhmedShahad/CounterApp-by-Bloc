part of 'top_news_api_bloc.dart';

sealed class TopNewsApiState extends Equatable {
  const TopNewsApiState();
  
  @override
  List<Object> get props => [];
}

final class TopNewsApiInitial extends TopNewsApiState {}
