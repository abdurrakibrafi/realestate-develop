import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/favoriteModels/add_favorite_model.dart';
import 'package:real_estate_management/models/favoriteModels/delete_favorite_model.dart';
import 'package:real_estate_management/models/favoriteModels/favorite_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class FavoriteRepository {
  final _apiService = NetworkApiServices();

  Future<FavoriteModel> favoriteApi(String residence) async {
    String addUrl = AppUrl.favoriteUrl;
    dynamic response =
        await _apiService.getApi("$addUrl?residence=$residence&limit=10000");
    log(response.toString());

    return FavoriteModel.fromJson(response);
  }

  Future<AddFavoriteModel> addFavoriteApi(var data, String residence) async {
    String addUrl = AppUrl.addFavoriteUrl;
    dynamic response = await _apiService.postApi(data, addUrl);
    log(response.toString());

    return AddFavoriteModel.fromJson(response);
  }

  Future<DeleteFavoriteModel> deleteFavoriteApi(String residence) async {
    String addUrl = AppUrl.deleteFavoriteUrl;
    dynamic response = await _apiService.deleteApi("$addUrl$residence");
    log(response.toString());

    return DeleteFavoriteModel.fromJson(response);
  }
}
