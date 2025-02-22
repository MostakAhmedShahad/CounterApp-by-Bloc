import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePeakerState extends Equatable {
  final XFile? file;
  const ImagePeakerState({this.file});

  ImagePeakerState copyWith({XFile? file}) {
    return ImagePeakerState(file: file ?? this.file);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
