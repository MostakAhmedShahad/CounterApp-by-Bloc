part of 'list_view_bloc.dart';

sealed class ListViewState extends Equatable {
  const ListViewState();
  
  @override
  List<Object> get props => [];
}

final class ListViewInitial extends ListViewState {}
