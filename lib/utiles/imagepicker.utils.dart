import 'package:image_picker/image_picker.dart';

 class MyImagePicker{
  final ImagePicker _picker = ImagePicker();


 Future<XFile?> imageCapture() async{
  final XFile? file = await _picker.pickImage(source: ImageSource.camera);
  return file;
 }


 
 Future<XFile?> imagePickerGallery() async{
  final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
  return file;
 }

}



