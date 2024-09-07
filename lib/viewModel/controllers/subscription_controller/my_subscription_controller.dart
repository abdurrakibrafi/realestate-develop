import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/subscriptionModels/my_subscription_model.dart';
import 'package:real_estate_management/repository/subscription_repository/my_subscription_repository.dart';

import 'package:real_estate_management/utils/utils.dart';

class MySubscriptionController extends GetxController {
  final MySubscriptionRepository _api = MySubscriptionRepository();
  final Rx<Data?> mySubscriptionData = Rx<Data?>(null);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      MySubscriptionModel mySubscriptionModel = await _api.mySubscriptionApi();
      if (mySubscriptionModel.data != null &&
          mySubscriptionModel.success == true) {
        mySubscriptionData.value = mySubscriptionModel.data;
      } else {
        Utils.snackBar("Error", "Failed to fetch data or no data available");
      }
    } catch (e) {
      log(e.toString());
      //Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
