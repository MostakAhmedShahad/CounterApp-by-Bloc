

import 'package:equatable/equatable.dart';

abstract class ImagePeakerEvent extends Equatable {

  const ImagePeakerEvent();
  @override
  List<Object> get props=> [];
}

class CameraCapture extends ImagePeakerEvent{}

class GallaryImagePeaker extends ImagePeakerEvent{}