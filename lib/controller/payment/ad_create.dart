import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_management/controller/payment/payment_controller.dart';

import '../../view/common/payment/view/payment_webview.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart'; // Assuming you have this file for UserPreference

class AdController extends GetxController {
  final PaymentRequestController paymentRequestController = Get.put(PaymentRequestController());
  final ImagePicker _picker = ImagePicker();
  var isLoading = false.obs;

  Future<void> createAd({required int month, required String propertyId, required String image}) async {
    // Pick an image

    try {
      isLoading.value = true;

      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://115.127.156.14:9005/api/v1/ads/create-ad'),
      );

      // Add headers
      request.headers.addAll({
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      });

      // Add the image to the request
      request.files.add(await http.MultipartFile.fromPath('banner', image));

      // Add the other fields
      request.fields['month'] = month.toString();
      request.fields['property'] = propertyId;

      // Send the request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);

      print(response.statusCode);
      // Handle the response
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Ad created successfully");
        var paymentLink = jsonResponse['data']['paymentLink'];
        Get.to(() => PaymentWebView(paymentUrl: paymentLink));
        isLoading.value = false;
      } else {
        Get.snackbar("Error", jsonResponse['message']);
        isLoading.value = false;
      }
    } catch (e) {
    //  Get.snackbar("Error", "An error occurred: $e");
      isLoading.value = false;
      print(e);
    }
  }
}
