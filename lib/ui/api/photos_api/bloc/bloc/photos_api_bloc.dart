import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photos_api_event.dart';
part 'photos_api_state.dart';

class PhotosApiBloc extends Bloc<PhotosApiEvent, PhotosApiState> {
  PhotosApiBloc() : super(PhotosApiInitial()) {
    on<PhotosApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
