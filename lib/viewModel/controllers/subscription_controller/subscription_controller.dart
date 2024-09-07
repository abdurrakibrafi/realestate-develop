import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/subscriptionModels/subscription_model.dart';
import 'package:real_estate_management/repository/subscription_repository/subscription_repository.dart';

import 'package:real_estate_management/utils/utils.dart';

class SubscriptionController extends GetxController {
  final SubscriptionRepository _api = SubscriptionRepository();
  final Rx<Data?> subscriptionData = Rx<Data?>(null);
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      SubscriptionModel subscriptionModel = await _api.subscriptionApi();
      if (subscriptionModel.data != null && subscriptionModel.success == true) {
        subscriptionData.value = subscriptionModel.data;
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
