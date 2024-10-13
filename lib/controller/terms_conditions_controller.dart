import 'package:get/get.dart';
import 'package:real_estate_management/models/terms_conditions_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'package:real_estate_management/service/base_client.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class ContentsController extends GetxController{
  var isLoading = false.obs;

  var contents = ContentsModel().obs;

  var termsConditionList = <Contents>[].obs;


  @override
  void onInit() {
    getContents();
    super.onInit();
  }

  ///getContents
  getContents() async {
    try {
      isLoading(true);
      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();


      var headers = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      };

      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.getRequest(
            api: AppUrl.contents, headers: headers),
      );
      if (responseBody != null) {
        termsConditionList.clear();

        contents.value = ContentsModel.fromJson(responseBody);
        termsConditionList.addAll(contents.value.data!.data);

        isLoading(false);
      } else {
        throw 'Unable to load get new booking data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}