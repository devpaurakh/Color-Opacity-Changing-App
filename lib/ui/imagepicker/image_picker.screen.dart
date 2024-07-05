import 'dart:io';

import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_bloc.dart';
import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_event.dart';
import 'package:coloropacityapp/bloc/imagepicker_bloc/imagepicker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),body: Center(
        child: Stack(
          children: [
            Image.asset('assets/next.jpg'),
            BlocBuilder<ImagePickerBloc, ImagePickerState>(builder: (context, state){
              return state.file == null ? InkWell(onTap: () {
                context.read<ImagePickerBloc>().add(ImageCaptureEvent());
              },
              child: const  CircleAvatar(child: Icon(Icons.camera),),
              ) : Image.file(File(state.file!.path.toString()));
              }),
          ],
        ),
      ),

    );
  }
}
