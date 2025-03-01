 import 'package:equatable/equatable.dart';

abstract class TopNewsApiEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTopNews extends TopNewsApiEvent {}
