import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_management/models/adsModels/category_model.dart';
import 'package:real_estate_management/models/adsModels/single_category_model.dart';
import 'dart:convert';

import 'package:real_estate_management/res/app_url/app_url.dart';

class AdsCategoryController extends GetxController {
  var isLoading = true.obs;
  var categoryList = <Map<String, String?>>[].obs;
  var selectedItem = "".obs;
  var adsDataList = <SingleCat>[].obs;
  var currentPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(AppUrl.addCat));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        CategoryModel categoryModel = CategoryModel.fromJson(jsonData);

        List<Map<String, String?>> categories = [
          {"id": null, "name": "All"}
        ];

        categories.addAll(categoryModel.data?.data
                .map((item) => {"id": item.id, "name": item.name})
                .toList() ??
            []);

        categoryList.assignAll(categories);
        print("all ads categoryList:::::: $categoryList");

        selectedItem.value = "All";

        fetchAdsByCategory(
            categoryId: null, page: currentPage.value.toString());
      } else {
        Get.snackbar("Error", "Failed to fetch categories");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching categories");
    } finally {
      isLoading(false);
    }
  }

  void fetchAdsByCategory({String? categoryId, required String page}) async {
    try {
      isLoading(true);
      var url = categoryId == null || categoryId.isEmpty
          ? "${AppUrl.baseUrl}/ads?page=$page"
          : '${AppUrl.baseUrl}/ads?category=$categoryId&page=$page';

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        CategoryModelSingle categoryModelSingle =
            CategoryModelSingle.fromJson(jsonData);
        List<SingleCat> ads = categoryModelSingle.data?.data ?? [];

        if (page == '1') {
          adsDataList.assignAll(ads);
        } else {
          adsDataList.addAll(ads);
        }
      } else {
        Get.snackbar("Error", "Failed to fetch ads");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred while fetching ads");
    } finally {
      isLoading(false);
    }
  }

  void selectItem(String item, String categoryId) {
    selectedItem.value = item;
    currentPage.value = 1;
    fetchAdsByCategory(
        categoryId: categoryId, page: currentPage.value.toString());
  }

  // Call this method to load more ads when the user reaches the bottom of the list
  void loadMoreAds(String categoryId) {
    currentPage.value++;
    fetchAdsByCategory(
        categoryId: categoryId, page: currentPage.value.toString());
  }
}
