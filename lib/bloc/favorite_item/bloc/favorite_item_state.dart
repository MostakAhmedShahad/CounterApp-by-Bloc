 
import 'package:equatable/equatable.dart';

  class FavoriteItemState extends Equatable {

  final List<String> name;
  const FavoriteItemState({this.name=const []});

  FavoriteItemState copyWith({List<String>? name}){
    return FavoriteItemState(name : name?? this.name);
  }


  
  @override
  List<Object> get props => [name];
}

 
