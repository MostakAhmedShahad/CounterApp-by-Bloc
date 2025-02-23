part of 'list_view_bloc.dart';

  class ListViewState extends Equatable {
  final int num;
  const ListViewState({this.num=0});

  ListViewState copyWith({int? num}){
    return ListViewState(num: num ?? this.num);
  }
  
  @override
  List<Object> get props => [num!];
}
 
