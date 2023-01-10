import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {

  static Future<List<File>> pickMultipleImage() async {
    List<File> imageFiles = [];
    List<XFile>? images = await ImagePicker().pickMultiImage();

    if(images!=null) {
      for (int k = 0; k < images.length; k++)
        imageFiles.add(File(images[k].path));
    }

    return imageFiles;
  }

}