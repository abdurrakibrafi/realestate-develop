import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/ratingModel/add_rating_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class AddReviewRepository {
  final _apiService = NetworkApiServices();

  Future<AddRatingModel> callApi(var data) async {
    String addUrl = AppUrl.createReviewUrl;
    dynamic response = await _apiService.postApi(data,addUrl);
    log(response.toString());

    return AddRatingModel.fromJson(response);
  }
}
