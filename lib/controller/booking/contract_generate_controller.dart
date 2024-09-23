import 'package:get/get.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'package:real_estate_management/service/base_client.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractGenerateController extends GetxController{
  var isLoading = false.obs;


  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  ///getContractGenerate
  getContractGenerate({required String bookingId}) async {
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
            api: AppUrl.contractGenerate(bookingId: bookingId), headers: headers),
      );
      if (responseBody != null) {

        var generateLink = responseBody['data'];
        print(generateLink);

        _launchUrl(Uri.parse(generateLink));

        isLoading(false);
      } else {
        throw 'Unable to load get contract view data!';
      }
    } catch (e) {
      // kSnackBar(message: e.toString(), bgColor: failedColor);
      print(e);
    } finally {
      isLoading(false);
    }
  }
}