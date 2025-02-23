import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_view_event.dart';
part 'list_view_state.dart';

class ListViewBloc extends Bloc<ListViewEvent, ListViewState> {
  ListViewBloc() : super(ListViewInitial()) {
    on<ListViewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
