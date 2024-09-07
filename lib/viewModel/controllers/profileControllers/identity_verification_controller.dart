import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_management/repository/profile_repository/profile_repository.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/host/identityVerificationScreens/verification_done_page.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';

import '../../../res/app_url/app_url.dart';
import '../user_preference/user_preference_view_model.dart';

class IdentityVerificationController extends GetxController {
  IdentityVerificationController() {
    idTypeController = Get.put(
      DropdownController(['Passport', 'Security ID', 'Military ID', 'Civil ID'],
          selected: "Passport"),
      tag: 'IDType',
    );
  }
  var _api = ProfileRepository();
  late DropdownController idTypeController;
  final ImagePicker picker = ImagePicker();
  RxList<File> documentImages = RxList<File>([]);
  Rx<File?> pickedImage = Rx<File?>(null);
  var isTermsAccepted = false.obs;
  RxBool loading = false.obs;

  Future<void> pickImages() async {
    final List<XFile> images = await picker.pickMultiImage();
    if (images.length <= 10) {
      documentImages.value = images.map((image) => File(image.path)).toList();
    } else {
      Utils.snackBar("Error", "You can select up to 10 images.");
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  Future<void> takeSelfie() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage.value = File(image.path);
    }
  }

  bool validateFirstPage() {
    if (documentImages.isEmpty) {
      Utils.snackBar("Validation Failed", "Please submit minimum one document");
      return false;
    }
    if (isTermsAccepted.value == false) {
      Utils.snackBar("Validation Failed", "Please accept the agreement");
      return false;
    }
    return true;
  }

  void api() async {
    try {
      loading.value = true;
      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();
      // Prepare the data and files
      Map<String, String> data = {
        "verificationRequest": "send",
        "documentType": idTypeController.selected.value
      };



      List<http.MultipartFile> imageFiles = [];
      for (var image in documentImages) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        imageFiles.add(
          http.MultipartFile('document', stream, length,
              filename: image.path.split('/').last),
        );
      }

      http.MultipartFile? imageFile;
      if (pickedImage.value != null) {
        var stream = http.ByteStream(pickedImage.value!.openRead());
        var length = await pickedImage.value!.length();
        imageFile = http.MultipartFile(
          'selfie',
          stream,
          length,
          filename: "property_image.jpg",
        );
      }

      // Create the request
      var uri = Uri.parse(AppUrl.usersVerify);
      var request = http.MultipartRequest('PATCH', uri)
        ..fields['data'] = jsonEncode(data)
        ..files.addAll(imageFiles);
      if (imageFile != null) {
        request.files.add(imageFile);
      }
      request.headers['Authorization'] = 'Bearer $token';

      print("Hit API: $uri");

      // Send the request
      var response = await request.send();

      // Handle response
      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        var responseBody = jsonDecode(responseData.body);
        if (responseBody['success'] == true) {
          loading.value = false;
          Utils.snackBar("Successfully", responseBody['message']);
          Get.offAll(const VerificationDonePage());
        } else {
          loading.value = false;
          Utils.snackBar("Failed", responseBody['message']);
          print(responseBody['success']);
        }
      } else if (response.statusCode == 413) {
        var responseData = await http.Response.fromStream(response);
        var responseBody = jsonDecode(responseData.body);

        loading.value = false;
        Utils.snackBar("Failed", "Request entity too large. Try reducing the file size.");
        log("HTTP Error: 413 - Request entity too large.");
        log("${responseBody}");
      } else {
        loading.value = false;
        Utils.snackBar("Failed", "Some error occurred: ${response.statusCode}");
        log("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      loading.value = false;
      Utils.snackBar("Failed", "Some error occurred");
      log(e.toString() + " 4444444444444");

    }
  }
}
