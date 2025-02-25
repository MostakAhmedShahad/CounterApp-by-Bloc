import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_item_event.dart';
part 'favorite_item_state.dart';

class FavoriteItemBloc extends Bloc<FavoriteItemEvent, FavoriteItemState> {
  FavoriteItemBloc() : super(FavoriteItemInitial()) {
    on<FavoriteItemEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
