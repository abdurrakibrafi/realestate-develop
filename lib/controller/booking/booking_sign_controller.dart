import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_management/controller/booking/my_booked_controller.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import 'package:signature/signature.dart';

import '../../view/guest/schedulingScreens/booking_success_page.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';

class BookingSignController extends GetxController {
  final MyBookedController myBookedController = Get.put(MyBookedController());
  var isLoading = false.obs;

  final ImagePicker picker = ImagePicker();

  RxList<File> pickedImages = RxList<File>([]);

  Future<void> pickImages() async {
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null && images.length <= 10) {
      pickedImages.value = images.map((image) => File(image.path)).toList();
    } else {
      Utils.snackBar("Error", "You can select up to 10 images.");
    }
  }

  Future<void> submitSignature(String bookingId, SignatureController signatureController, String civilId) async {
    try {
      isLoading.value = true;

      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();

      // Export signature as PNG image
      final Uint8List? signatureData = await signatureController.toPngBytes();

      if (signatureData != null) {
        // Save the signature image to a temporary file
        final tempDir = await getTemporaryDirectory();
        final tempFile = File('${tempDir.path}/signature.png');
        await tempFile.writeAsBytes(signatureData);

        // Prepare the multipart request
        final url = AppUrl.bockingSignLandlord;
        final request = http.MultipartRequest('POST', Uri.parse(url));

        // Attach the signature image
        request.files.add(await http.MultipartFile.fromPath(
          'signature',
          tempFile.path,
        ));

        // Attach the selected images
        for (var image in pickedImages) {
          request.files.add(await http.MultipartFile.fromPath(
            'documents',  // Ensure this field name is correct based on the API specification
            image.path,
            filename: image.path.split('/').last,
          ));
        }

        // Attach other fields
        request.fields['booking'] = bookingId;
        request.fields['landlord[civilId]'] = civilId;

        // Add the token to the headers
        request.headers['Authorization'] = 'Bearer $token';

        // Send the request
        final response = await request.send();

        print(url);
        // Handle the response
        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final responseData = json.decode(responseBody);
          print('Success: $responseData');
          await myBookedController.getBookingRequest();
          Get.offAll(() => BookingSuccessPage());
          Get.snackbar("Success", "Signing successfully done.");
        } else {
          print('Failed with status code: ${response.statusCode}');
        }
      } else {
        print('No signature data found.');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitTenantSignature(String bookingId, SignatureController signatureController, String civilId) async {
    try {
      isLoading.value = true;

      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();

      // Export signature as PNG image
      final Uint8List? signatureData = await signatureController.toPngBytes();

      if (signatureData != null) {
        // Save the signature image to a temporary file
        final tempDir = await getTemporaryDirectory();
        final tempFile = File('${tempDir.path}/signature.png');
        await tempFile.writeAsBytes(signatureData);

        // Prepare the multipart request
        final url = AppUrl.bockingSignTenant(bookingId);
        final request = http.MultipartRequest('PATCH', Uri.parse(url));

        // Attach the signature image
        request.files.add(await http.MultipartFile.fromPath(
          'signature',
          tempFile.path,
        ));

        // Attach the selected images
        for (var image in pickedImages) {
          request.files.add(await http.MultipartFile.fromPath(
            'documents',  // Ensure this field name is correct based on the API specification
            image.path,
            filename: image.path.split('/').last,
          ));
        }

        // Attach other fields
        request.fields['user[civilId]'] = civilId;

        // Add the token to the headers
        request.headers['Authorization'] = 'Bearer $token';

        // Send the request
        final response = await request.send();
        print(url);

        // Handle the response
        if (response.statusCode == 200) {
          final responseBody = await response.stream.bytesToString();
          final responseData = json.decode(responseBody);
          print('Success: $responseData');
          await myBookedController.getBookingRequest();
          Get.offAll(() => BookingSuccessPage());
          Get.snackbar("Success", "Signing successfully done.");
        } else {
          print('Failed with status code: ${response.statusCode}');
        }
      } else {
        print('No signature data found.');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
