import 'package:app_10/bloc/favorite_item/bloc/favorite_item_state.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favorite_item_event.dart';


class FavoriteItemBloc extends Bloc<NameEvent, NameState> {
  FavoriteItemBloc() : super(NameState(names: [], deletedNames: [])) {
    on<AddName>((event, emit) {
      final updatedNames = List<String>.from(state.names)..add(event.name);
      emit(NameState(names: updatedNames, deletedNames: state.deletedNames));
    });

    on<DeleteName>((event, emit) {
      final updatedNames = List<String>.from(state.names)..remove(event.name);
      final updatedDeletedNames = List<String>.from(state.deletedNames)..add(event.name);
      emit(NameState(names: updatedNames, deletedNames: updatedDeletedNames));
    });
  }
}

// class FavoriteItemBloc extends Bloc<FavoriteItemEvent, FavoriteItemState> {
//   FavoriteItemBloc() : super(FavoriteItemState()) {
//     on<Add_item>(add_item);
//     //on<Delete_item>(delete_item);
//     on<MoveItem>(moveItem);
//   }

//   void add_item(Add_item event, Emitter<FavoriteItemState> emit) {
//     print('inside ADD_ITEM');
    

//   if (event.NewItem.isEmpty) return; // Prevent empty items

//   final updatedList = List<String>.from(state.name)..add(event.NewItem);
//   emit(state.copyWith(name: updatedList));
//    print(state.name);
// }


//   // void delete_item(Delete_item event, Emitter<FavoriteItemState> emit) {
//   //   final updatedList = List<String>.from(state.name)..removeAt(event.index);
//   //   emit(state.copyWith(name: updatedList));
//   // }

//   void moveItem(MoveItem event, Emitter<FavoriteItemState> emit) {
//   final updatedNameList = List<String>.from(state.name);
//   final updatedDeletedList = List<String>.from(state.deletedItem);

//   if (event.index >= 0 && event.index < updatedNameList.length) {
//     final item = updatedNameList.removeAt(event.index); // Remove from name list
//     updatedDeletedList.add(item); // Add to deleted list
//   }

//   emit(state.copyWith(name: updatedNameList, deletedItem: updatedDeletedList));
// }

// }
