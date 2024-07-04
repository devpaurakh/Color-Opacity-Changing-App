import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{

  const ImagePickerEvent();


 @override
 List<Object> get props =>[];
  
  }  


  class ImageCaptureEvent extends ImagePickerEvent{}

  class GalleryImagePickerEvent extends ImagePickerEvent{}

