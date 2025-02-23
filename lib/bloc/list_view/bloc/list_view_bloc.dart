import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_view_event.dart';
part 'list_view_state.dart';

class ListViewBloc extends Bloc<ListViewEvent, ListViewState> {
  ListViewBloc() : super(ListViewState()) {
    on<AddList>( _Add);
    on<DeleteList>( _delete);
  }

  void _Add(AddList event, Emitter<ListViewState>emit){

    emit(state.copyWith(num:state.num!+1));

  }
   void _delete(DeleteList event, Emitter<ListViewState>emit){

    emit(state.copyWith(num:state.num!-1));

  }
}
