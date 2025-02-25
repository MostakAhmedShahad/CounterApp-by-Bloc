part of 'favorite_item_bloc.dart';

abstract class FavoriteItemEvent extends Equatable {
  const FavoriteItemEvent();

  @override
  List<Object> get props => [];
}


class Add_item extends FavoriteItemEvent{
  final String NewItem;
  const Add_item(this.NewItem);
  @override
  List<Object> get props => [NewItem];


}
class Delete_item extends FavoriteItemEvent{

  final int index;
  const Delete_item(this.index);

  @override
  List<Object> get props => [index];
}


class MoveItem extends FavoriteItemEvent{

   //final List<String> deletedItem;
   final int index;
   final int newIndex;


   const  MoveItem(this.newIndex,this.index);

  @override
  List<Object> get props => [index,newIndex];


}



