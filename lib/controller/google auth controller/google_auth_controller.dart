import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'dart:convert';
import 'package:real_estate_management/view/guest/guest_root_screen.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';

class AuthController extends GetxController {
  UserPreference userPreference = UserPreference();

  Future<void> signInWithGoogle({
    required String email,
    required String role,
    required String name,
  }) async {
    const String url = "${AppUrl.baseUrl}/auth/sign-in-with-google";

    if (role == "Tenant") {
      role = "user";
    } else if (role == "Landlord") {
      role = "landlord";
    }

    final Map<String, dynamic> body = {
      "email": email,
      "role": role,
      "name": name,
      "registerWith": "google",
    };

    // Print the request body
    print("Request Body: ${jsonEncode(body)}");

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          print("Success: ${data['message']}");

          // Correctly access the user data
          final userId = data['data']['user']['_id'];
          final role = data['data']['user']['role'];
          final accessToken = data['data']['accessToken'];
          final name = data['data']['user']['name'];
          final proImage = data['data']['user']['image'];

          userPreference.saveUser(
            accessToken,
            userId,
            role,
            name,
            proImage,
          );

          Get.snackbar("Success", data['message']);

          // Navigate to the next page if successful
          Get.offAll(() => GuestRootScreen());
        } else {
          print("Failure: ${data['message']}");
          if (data['errorSources'] != null && data['errorSources'].isNotEmpty) {
            print("Error Source: ${data['errorSources'][0]['message']}");
          }
          Get.snackbar("Failed", data['message']);
        }
      } else {
        print("Unexpected status code: ${response.statusCode}");
        final data = jsonDecode(response.body);
        print("Error Message: ${data['message']}");
        if (data['err'] != null && data['err']['statusCode'] == 403) {
          print("Error 403: Unauthorized access");
          Get.snackbar("Failed", data['message']);
        }
      }
    } catch (e) {
      print("Exception: $e");
    }
  }
}
