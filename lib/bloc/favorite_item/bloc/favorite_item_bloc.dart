import 'package:app_10/bloc/favorite_item/bloc/favorite_item_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_item_event.dart';
 

class FavoriteItemBloc extends Bloc<FavoriteItemEvent, FavoriteItemState> {
  FavoriteItemBloc() : super(FavoriteItemState()) {
    on<Add_item> (add_item);
    on<Delete_item> (delete_item);
    

  }

  void add_item(Add_item event, Emitter<FavoriteItemState> emit){
       final updatedList = List<String>.from(state.name)..add(event.NewItem);
    emit(state.copyWith(name: updatedList));

  }

  void delete_item(Delete_item event, Emitter<FavoriteItemState> emit){
      final updatedList = List<String>.from(state.name)..removeAt(event.index);
    emit(state.copyWith(name: updatedList));
    
  }
}
