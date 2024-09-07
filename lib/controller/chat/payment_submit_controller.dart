import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadReceiptController extends GetxController {
  var isConfirmed = false.obs;
  var selectedImage = Rxn<File>();
  var selectedImagePath = ''.obs;

  final ImagePicker _picker = ImagePicker();

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
      selectedImage.value = File(image.path);
    }
  }
}
