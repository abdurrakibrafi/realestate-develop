import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/ratingModel/rating_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class ReviewRepository {
  final _apiService = NetworkApiServices();

  Future<RatingModel> api(String residence) async {
    String url = AppUrl.reviewUrl;
    dynamic response = await _apiService.getApi("$url?residence=$residence");
    log(response.toString());

    return RatingModel.fromJson(response);
  }
}
