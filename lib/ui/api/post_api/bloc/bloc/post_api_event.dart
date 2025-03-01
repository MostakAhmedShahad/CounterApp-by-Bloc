import 'package:equatable/equatable.dart';

abstract class PostApiEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPosts extends PostApiEvent {}
