import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/subscriptionModels/my_subscription_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class MySubscriptionRepository {
  final _apiService = NetworkApiServices();

  Future<MySubscriptionModel> mySubscriptionApi() async {
    String mySubscriptionUrl = AppUrl.mySubsriptionUrl;

    dynamic response = await _apiService.getApi(mySubscriptionUrl);
    log(response.toString());

    return MySubscriptionModel.fromJson(response);
  }
}
