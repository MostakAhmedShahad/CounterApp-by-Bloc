part of 'favorite_item_bloc.dart';

sealed class FavoriteItemState extends Equatable {
  const FavoriteItemState();
  
  @override
  List<Object> get props => [];
}

final class FavoriteItemInitial extends FavoriteItemState {}
