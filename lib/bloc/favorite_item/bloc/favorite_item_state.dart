import 'package:equatable/equatable.dart';

class FavoriteItemState extends Equatable {
  //final List<String> name;
   List<String> name = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> deletedItem;
  //const FavoriteItemState({this.deletedItem = const [], this.name = const []});
   FavoriteItemState({this.deletedItem=const[],this.name=const[]});

  FavoriteItemState copyWith({List<String>? name, List<String>? deletedItem}) {
    return FavoriteItemState(
        name: name ?? this.name, deletedItem: deletedItem ?? this.deletedItem);
  }

  @override
  List<Object> get props => [List.from(name), List.from(deletedItem)];
}
