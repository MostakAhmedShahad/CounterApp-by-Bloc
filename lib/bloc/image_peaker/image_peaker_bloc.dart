 
import 'package:app_10/bloc/image_peaker/image_peaker_event.dart';
import 'package:app_10/bloc/image_peaker/image_peaker_state.dart';
import 'package:app_10/utils/image_peaker_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePeakerBloc extends Bloc<ImagePeakerEvent, ImagePeakerState> {
  final ImagePeakerUtils imagePeakerUtils;
  ImagePeakerBloc(this.imagePeakerUtils) : super(const ImagePeakerState()) {


    on<CameraCapture>(cameraCapture);
    //on<PeakImageFromGallery>(PeakImageFromGallery);
    
  }

  void cameraCapture(CameraCapture event,Emitter<ImagePeakerState>emit) async{
    XFile? file=await imagePeakerUtils.CameraCapture(); 
    emit(state.copyWith(file: file));


  }
  //  void PeakImageFromGallery(PeakImageFromGallery event,Emitter<ImagePeakerState>emit){
    

  // }
}

 