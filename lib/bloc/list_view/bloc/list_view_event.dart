part of 'list_view_bloc.dart';

abstract class ListViewEvent extends Equatable {
  const ListViewEvent();

  @override
  List<Object> get props => [];
}

class AddList extends ListViewEvent{}
class DeleteList extends ListViewEvent{}



