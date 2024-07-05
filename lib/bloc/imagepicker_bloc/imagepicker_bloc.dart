import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_event.dart';
import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_state.dart';
import 'package:coloropacityapp/utiles/imagepicker.utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImageCaptureEvent, ImagePickerState >{

  final MyImagePicker _imagePicker;
  
  ImagePickerBloc(this._imagePicker): super( const ImagePickerState()){

    on<ImageCaptureEvent>(_imageCapture);

  }

void _imageCapture(ImageCaptureEvent event , Emitter<ImagePickerState> emit) async{

XFile? file = await  _imagePicker.imageCapture();
emit(state.copywith(file:file));

}

}