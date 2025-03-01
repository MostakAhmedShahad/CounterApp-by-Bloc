import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_news_api_event.dart';
part 'top_news_api_state.dart';

class TopNewsApiBloc extends Bloc<TopNewsApiEvent, TopNewsApiState> {
  TopNewsApiBloc() : super(TopNewsApiInitial()) {
    on<TopNewsApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
