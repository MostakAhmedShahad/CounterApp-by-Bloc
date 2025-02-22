import 'package:image_picker/image_picker.dart';

class ImagePeakerUtils {

  final ImagePicker _picker=ImagePicker();

  Future<XFile?> CameraCapture() async{
    final XFile? file= await _picker.pickImage(source : ImageSource.camera);
    return file;
  }


  // Future<XFile?> PeakImageFromGallery() async{
  //   final XFile? file= await _picker.pickImage(source : ImageSource.camera);
  //   return file;
  // }
}