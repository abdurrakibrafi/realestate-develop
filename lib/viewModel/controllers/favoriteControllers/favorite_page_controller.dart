import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/favoriteModels/add_favorite_model.dart';
import 'package:real_estate_management/models/favoriteModels/delete_favorite_model.dart';
import 'package:real_estate_management/models/favoriteModels/favorite_model.dart';
import 'package:real_estate_management/repository/favorite_repository/favorite_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class FavoritePageController extends GetxController {
  final String residence;
  FavoritePageController(this.residence);
  var selectedItem = 'All'.obs;
  var isFavorite = false.obs;

  final _api = FavoriteRepository();
  final RxList<AllFavoriteItems> favoriteDataList = <AllFavoriteItems>[].obs;
  final RxList<AllFavoriteItems> filteredDataList = <AllFavoriteItems>[].obs;
  var searchController = TextEditingController().obs;
  var isLoading = true.obs;
  final searchText = ''.obs;
  final categoryText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void searchFavorites(String query) {
    selectedItem.value = "All";
    searchText.value = query;
    log(searchText.value);
    if (query.isEmpty) {
      filteredDataList.assignAll(favoriteDataList);
    } else {
      filteredDataList.assignAll(
        favoriteDataList
            .where((item) => item.residence!.propertyName!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  void searchFavoritesByCetagory(String query) {
    searchController.value.clear();
    categoryText.value = query;
    log(categoryText.value);
    if (query.isEmpty) {
      filteredDataList.assignAll(favoriteDataList);
    } else {
      filteredDataList.assignAll(
        favoriteDataList
            .where((item) => item.residence!.category!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList(),
      );
    }
  }

  void fetchData() async {
    isLoading(true);
    try {
      FavoriteModel adsModel = await _api.favoriteApi(residence);
      if (adsModel.data != null && adsModel.success == true) {
        favoriteDataList.assignAll(adsModel.data!.allFavoriteItems!);
        filteredDataList.assignAll(favoriteDataList);
        isFavorite.value = favoriteDataList.isNotEmpty;
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

  void addData() async {
    if (isFavorite.value == false) {
      Map<String, dynamic> data = {
        "residence": residence,
      };
      AddFavoriteModel model = await _api.addFavoriteApi(data, residence);
      if (model.data != null && model.success == true) {
        isFavorite.value = true;
      } else {
        isFavorite.value = false;
      }
    } else if (isFavorite.value == true) {
      DeleteFavoriteModel model = await _api.deleteFavoriteApi(residence);
      if (model.data != null && model.success == true) {
        isFavorite.value = false;
      } else {
        isFavorite.value = true;
      }
    }
  }

  void selectItem(String item) {
    selectedItem.value = item;
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   searchController.value.dispose();
  //   selectedItem.value = "All";
  // }
}
