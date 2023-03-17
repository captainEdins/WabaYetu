import 'dart:io';
import 'dart:typed_data';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../resource/color.dart';
class DisplayImageDash extends StatefulWidget {
  final String imagePath;

  // Constructor
  const DisplayImageDash({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<DisplayImageDash> createState() => _DisplayImageDashState();
}

class _DisplayImageDashState extends State<DisplayImageDash> {


  bool _isLoading = false;
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    const color = ColorList.navyBlue;

    return Center(
        child: Stack(children: [
          buildImage(color),
        ]));
  }



  // Builds Profile Image
  Widget buildImage(Color color) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: color,
      child: _image != null
          ? CircleAvatar(
        radius: 30,
        backgroundImage: MemoryImage(_image!),
      )
          : widget.imagePath.contains('images') ?
      CircleAvatar(
        backgroundImage: AssetImage(widget.imagePath),
        radius: 30,
      ) : CachedNetworkImage(
        imageUrl: widget.imagePath,
        width: 30,
        height: 30,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ) ,
    );

  }

  // Builds Edit Icon on Profile Picture


  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
            padding: EdgeInsets.all(all),
            color: Colors.white,
            child: child,
          ));

}

