import 'dart:convert';

import 'package:get/get.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'package:real_estate_management/view/common/payment/view/payment_failed.dart';
import 'package:real_estate_management/view/common/payment/view/payment_success.dart';
import '../../../../service/base_client.dart';
import '../../../../service/local_storage.dart';
import '../../../../utils/app_constant.dart';
import '../../view/common/payment/view/payment_webview.dart';
import '../../view/host/bookingRequestScreens/booking_sign_view.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';

class PaymentRequestController extends GetxController{
  var isLoading = false.obs;
  var isSuccess = false.obs;

  ///paymentRequest
  paymentRequest(
      {
        required bookingId,
        required BookingResidence,
      }
      ) async {
    try {
      isLoading(true);
      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();
      final body = jsonEncode(
          {
        "bookingId": bookingId,
        "paymentType": BookingResidence,
      }
      );

      var headers = {
        'Content-Type': 'application/json',
        //  'Accept': 'application/json',
        "Authorization": "Bearer $token" ?? ''
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(api: AppUrl.payment,body: body,headers: headers),
      );
      if (responseBody != null) {
        String paymentUrl = responseBody['data']['data']['link'].toString();
        print(paymentUrl);
        Get.to(() => PaymentWebView(paymentUrl: paymentUrl));

        isLoading(false);

      } else {
        throw 'Unable to load payment data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }



  ///paymentDone
  paymentDone({required String paymentUrl}) async {
    try {
      isLoading(true);
      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();
      var headers = {
        'Content-Type': 'application/json',
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(api: paymentUrl,headers: headers),
      );
      if (responseBody != null) {
        print("payment");

        bool success = responseBody['success'];
        String orderIdNo = responseBody['data']['details'];

        print(success);

       // isSuccess.value = success;

        if(success == true){
       //   Get.offAll(() => PaymentSuccess());
          Get.offAll(() => BookingSignView(bookingId: '${orderIdNo}', isTenant: true,));
        }else{
          Get.offAll(() => PaymentFailed());
        }

        isLoading(false);

      } else {
        throw 'Unable to load payment data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }

}