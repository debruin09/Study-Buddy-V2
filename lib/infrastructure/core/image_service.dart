import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  final imagePicker = ImagePicker();

  Future<File> getImage() async {
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);

    return File(pickedImage.path);
  }
}
