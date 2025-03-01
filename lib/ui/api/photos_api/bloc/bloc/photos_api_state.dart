part of 'photos_api_bloc.dart';

sealed class PhotosApiState extends Equatable {
  const PhotosApiState();
  
  @override
  List<Object> get props => [];
}

final class PhotosApiInitial extends PhotosApiState {}
