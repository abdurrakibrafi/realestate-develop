import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:real_estate_management/models/maintenanceRequestModel/maintenance_request_model.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/viewModel/controllers/maintenanceRequestControllers/maintenance_request_accept_decline_controller.dart';

class MaintenanceFormPage extends StatelessWidget {
  final bool isPending;
  final MRData data;
  const MaintenanceFormPage({super.key, required this.data, required this.isPending});

  @override
  Widget build(BuildContext context) {
    MaintenanceRequestAcceptDeclineController controller =
        Get.put(MaintenanceRequestAcceptDeclineController(), permanent: false);
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Maintenance Details".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               /* Center(
                  child: commonText("Maintenance Details",
                      isBold: true, size: 20, color: AppColor.primaryColor),
                ),*/
                const SizedBox(
                  height: 20,
                ),
                commonTextRow("Full Name:", data.extraInfo!.name!),
                commonTextRow("Phone Number:", data.extraInfo!.phoneNumber!),
                commonTextRow("E-mail:", data.extraInfo!.email!),
                commonTextRow("Apartment:", data.extraInfo!.apartment!),
                commonTextRow("Floor:", data.extraInfo!.floor!),
                commonTextRow("Address:", data.extraInfo!.address!),
                const SizedBox(
                  height: 20,
                ),
                commonText("Description of issue", size: 16),
                const SizedBox(
                  height: 5,
                ),
                commonText(data.problems!, size: 12,color: AppColor.primaryColor),
                const SizedBox(
                  height: 20,
                ),
                commonText("Picture", size: 16),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    itemCount: data.images.length,
                    itemBuilder: (context, index) {
                      return material.Image.network(
                        data.images[index].url ?? DummyImage.networkImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return material.Image.network(
                            DummyImage.networkImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          );
                        },
                      );
                    }),
                const SizedBox(
                  height: 30,
                ),
               isPending == true? Obx(() {
                  return Row(
                    children: [
                      Expanded(
                          child: commonBorderButton("Cancel",
                              isLoading: controller.loadingc.value, onTap: () {
                        controller.updateProfileApi(data.id!, false);
                      })),
                      Expanded(
                          child: commonButton("Accept",
                              isLoading: controller.loadinga.value, onTap: () {
                        controller.updateProfileApi(data.id!, true);
                      })),
                    ],
                  );
                }) : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonTextRow(String startText, String endText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(startText,
              size: 15, color: AppColor.superDarkGreyColor,isBold: true),
          commonText(endText, size: 15,color: AppColor.primaryColor),
        ],
      ),
    );
  }
}
