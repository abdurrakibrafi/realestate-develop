import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class ResidencesRepository {
  final _apiService = NetworkApiServices();

  Future<ResidencesModel> residencesApi(
      {String searchValue = '',
      String category = '',
      String budget = "",
      String rooms = "",
      String rentingType = "",
      String residenceType = "",
      String features = "",
      String governorate = "",
      int page = 1,
      int limit = 10,
      String host = ""}) async {
    // Constructing the URL with pagination, search value, and category filters
    String addUrl = AppUrl.residenceUrl(
        searchValue: searchValue,
        category: category,
        page: page.toString(),
        limit: limit.toString(),
        budget: budget,
        rooms: rooms,
        rentingType: rentingType,
       // residenceType: residenceType,
        features: features,
        governorate: governorate,
        host: host);


    dynamic response = await _apiService.getApi(addUrl);
    log(response.toString());

    return ResidencesModel.fromJson(response);
  }
}
