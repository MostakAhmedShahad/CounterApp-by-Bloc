import 'dart:io';

import 'package:app_10/bloc/image_peaker/image_peaker_bloc.dart';
import 'package:app_10/bloc/image_peaker/image_peaker_event.dart';
import 'package:app_10/bloc/image_peaker/image_peaker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePeakerScreen extends StatefulWidget {
  const ImagePeakerScreen({super.key});

  @override
  State<ImagePeakerScreen> createState() => _ImagePeakerScreenState();
}

class _ImagePeakerScreenState extends State<ImagePeakerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image peaker bloc"),
      ),
      body: Center(
        child: BlocBuilder<ImagePeakerBloc, ImagePeakerState>(
          builder: (context, state) {
            if(state.file==null){
              return InkWell(

                onTap: () {
                  context.read<ImagePeakerBloc>().add(CameraCapture());
                },
                child: const CircleAvatar(
                  child: Icon(Icons.camera),
                ),
                
              );
            }
            else{
              return Image.file(File(state.file!.path.toString()));
            }
             
          },
        ),
      ),
       
    );
  }
}
