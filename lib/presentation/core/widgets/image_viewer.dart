import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;
  final double height, width;
  final Function onPressed;
  ImageViewer({
    Key key,
    this.imageUrl,
    this.width,
    this.onPressed,
    this.height,
  }) : super(key: key);

  final controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onPressed,
      child: InteractiveViewer(
        panEnabled: false,
        transformationController: controller,
        boundaryMargin: EdgeInsets.all(10.0),
        maxScale: 3.0,
        minScale: 0.5,
        child: Image.network(
          imageUrl,
          height: height,
          width: width,
        ),
      ),
    );
  }
}

class ImageViewerPage extends StatelessWidget {
  final File imageFile;

  ImageViewerPage({Key key, @required this.imageFile}) : super(key: key);
  final controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: controller,
      boundaryMargin: EdgeInsets.all(10.0),
      maxScale: 3.0,
      minScale: 0.5,
      child: Image.file(imageFile),
    );
  }
}
