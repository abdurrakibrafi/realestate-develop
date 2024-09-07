import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/ratingModel/rating_model.dart';
import 'package:real_estate_management/repository/review_repository/review_repository.dart';
import 'package:real_estate_management/utils/utils.dart';

class RatingController extends GetxController {
  final String residence;
  RatingController(this.residence);
  final _api = ReviewRepository();
  final RxList<Data> list = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    isLoading(true);
    try {
      RatingModel model = await _api.api(residence);
      if (model.ratingData != null && model.success == true) {
        list.assignAll(model.ratingData!.data!);
      } else {
        Utils.snackBar("Error", model.message!);
      }
    } catch (e) {
      log(e.toString());
     // Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
